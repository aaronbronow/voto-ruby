require 'voto_ruby/rest/base_list'
require 'voto_ruby/rest/base_client'
require 'voto_ruby/rest/client/incoming_calls'
require 'voto_ruby/rest/client/subscribers'
require 'voto_ruby/rest/client/surveys'
require 'voto_ruby/rest/client/questions'

module VotoMobile
  module REST
    class Client < BaseClient
      include VotoMobile::IncomingCalls
      include VotoMobile::Subscribers
      include VotoMobile::Surveys
      include VotoMobile::Questions
      
      def initialize(*args)
        super(*args)
      end

      def inspect # :nodoc:
        "<VotoMobile::REST::Client @api_key=#{@auth_token}>"
      end
    end
  end
end
