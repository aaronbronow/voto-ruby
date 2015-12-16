module VotoMobile
  module REST
    ##
    # Instantiate a client like so:
    #
    #   @client = VotoMobile::REST::Client.new auth_token
    #
    # Implementation based on:
    # https://github.com/twilio/twilio-ruby/blob/master/lib/twilio-ruby/rest/client.rb
    #
    class BaseClient
      include VotoMobile::Util
      API_VERSION = 'v1'
      HTTP_HEADERS = {
        'Accept' => 'application/json',
        'Accept-Charset' => 'utf-8',
        'User-Agent' => "voto_ruby/#{VotoMobile::VERSION}" \
                        " (#{RUBY_ENGINE}/#{RUBY_PLATFORM}" \
                        " #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL})"
      }

      DEFAULTS = {
        host: 'go.votomobile.org',
        port: 443,
        use_ssl: true,
        timeout: 30,
        proxy_addr: nil,
        proxy_port: nil,
        proxy_user: nil,
        proxy_pass: nil,
        retry_limit: 1
      }

      def initialize(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        @config = DEFAULTS.merge! options

        @auth_token = args[0] || VotoMobile.auth_token
        if @auth_token.nil?
          raise ArgumentError, 'API key is required'
        else
          HTTP_HEADERS['api_key'] = @auth_token
        end

        set_up_connection
        set_up_subresources
      end
      
      ##
      # Define #get, #put, #post and #delete helper methods for sending HTTP
      # requests to Voto. You shouldn't need to use these methods directly,
      # but they can be useful for debugging. Each method returns a hash
      # obtained from parsing the JSON object in the response body.
      [:get, :put, :post, :delete].each do |method|
        method_class = Net::HTTP.const_get method.to_s.capitalize
        define_method method do |path, *args|
          params = args[0].to_a; params = [] if args.empty?
          unless args[1] # build the full path unless already given
            path = "/api/#{API_VERSION}/#{path}"
            path << "?#{url_encode(params)}" if method == :get && !params.empty?
          end
          request = method_class.new path, HTTP_HEADERS
          request.initialize_http_header({"api_key" => @auth_token})
          request.form_data = params if [:post, :put].include? method
          connect_and_send request
        end
      end

      private

      ##
      # Set up and cache a Net::HTTP object to use when making requests. This is
      # a private method documented for completeness.
      def set_up_connection # :doc:
        connection_class = Net::HTTP::Proxy @config[:proxy_addr],
          @config[:proxy_port], @config[:proxy_user], @config[:proxy_pass]
        @connection = connection_class.new @config[:host], @config[:port]
        set_up_ssl
        @connection.open_timeout = @config[:timeout]
        @connection.read_timeout = @config[:timeout]
      end

      ##
      # Set up the ssl properties of the <tt>@connection</tt> Net::HTTP object.
      # This is a private method documented for completeness.
      def set_up_ssl # :doc:
        @connection.use_ssl = @config[:use_ssl]
        if @config[:ssl_verify_peer]
          @connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
          @connection.ca_file = @config[:ssl_ca_file]
        else
          @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
      end

      ##
      # Set up +account+ and +accounts+ attributes.
      def set_up_subresources # :doc:
        # @accounts = Twilio::REST::Accounts.new "/#{API_VERSION}/Accounts", self
        # @account = @accounts.get @account_sid
      end
      
      ##
      # Send an HTTP request using the cached <tt>@connection</tt> object and
      # return the JSON response body parsed into a hash. Also save the raw
      # Net::HTTP::Request and Net::HTTP::Response objects as
      # <tt>@last_request</tt> and <tt>@last_response</tt> to allow for
      # inspection later.
      def connect_and_send(request) # :doc:
        @last_request = request
        retries_left = @config[:retry_limit]
        begin
          response = @connection.start do |http|
            http.request request
          end
          @last_response = response
          if response.kind_of? Net::HTTPServerError
            raise VotoMobile::REST::ServerError
          end
        rescue Exception
          raise if request.class == Net::HTTP::Post
          if retries_left > 0 then retries_left -= 1; retry else raise end
        end
        if response.body and !response.body.empty?
          object = MultiJson.load response.body
        end
        if response.kind_of? Net::HTTPClientError
          raise VotoMobile::REST::RequestError.new object['message'], object['code']
        end
        object
      end
    end
  end
end