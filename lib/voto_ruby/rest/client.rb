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
    class Client
      HTTP_HEADERS = {
        'Accept' => 'application/json',
        'Accept-Charset' => 'utf-8',
        'User-Agent' => "voto_ruby/#{VotoMobile::VERSION}" \
                        " (#{RUBY_ENGINE}/#{RUBY_PLATFORM}" \
                        " #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL})"
      }

      DEFAULTS = {
        host: 'go.votomobile.org/api/v1',
        port: 443,
        use_ssl: true,
        timeout: 30,
        proxy_addr: nil,
        proxy_port: nil,
        proxy_user: nil,
        proxy_pass: nil,
        retry_limit: 1
      }

      # attr_reader :account_sid, :account, :accounts, :last_request,
      #   :last_response

      def initialize(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        @config = DEFAULTS.merge! options

        # @account_sid = args[0] || VotoMobile.account_sid
        @auth_token = args[0] || VotoMobile.auth_token
        # if @account_sid.nil? || @auth_token.nil?
        if @auth_token.nil?
          raise ArgumentError, 'API key is required'
        end

        set_up_connection
        set_up_subresources
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
    end
  end
end