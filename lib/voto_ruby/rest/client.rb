require 'voto_ruby/rest/base_client'
require 'voto_ruby/rest/client/incoming_calls'
require 'voto_ruby/rest/client/subscribers'

module VotoMobile
  module REST
    class Client < BaseClient
      include VotoMobile::IncomingCalls
      include VotoMobile::Subscribers
      
      def initialize(*args)
        super(*args)
      end

      def inspect # :nodoc:
        "<VotoMobile::REST::Client @api_key=#{@auth_token}>"
      end
    end
  end
end
