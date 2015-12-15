require 'voto_ruby/rest/base_client'

module VotoMobile
  module REST
    class Client < BaseClient
      def initialize(*args)
        super(*args)
      end

      def inspect # :nodoc:
        "<VotoMobile::REST::Client @api_key=#{@auth_token}>"
      end      
    end
  end
end
