require 'voto_ruby/rest/base_list'
require 'voto_ruby/rest/base_client'
require 'voto_ruby/rest/entity'
require 'voto_ruby/rest/entities/delivery_log'
require 'voto_ruby/rest/entities/incoming_call'
require 'voto_ruby/rest/entities/language'
require 'voto_ruby/rest/entities/question'
require 'voto_ruby/rest/entities/response'
require 'voto_ruby/rest/entities/survey'
require 'voto_ruby/rest/entities/survey_result'
require 'voto_ruby/rest/client/delivery_logs'
require 'voto_ruby/rest/client/incoming_calls'
require 'voto_ruby/rest/client/languages'
require 'voto_ruby/rest/client/questions'
require 'voto_ruby/rest/client/responses'
require 'voto_ruby/rest/client/subscribers'
require 'voto_ruby/rest/client/survey_results'
require 'voto_ruby/rest/client/surveys'

module VotoMobile
  module REST
    class Client < BaseClient
      include VotoMobile::DeliveryLogs
      include VotoMobile::IncomingCalls
      include VotoMobile::Languages
      include VotoMobile::Questions
      include VotoMobile::Responses
      include VotoMobile::Subscribers
      include VotoMobile::SurveyResults
      include VotoMobile::Surveys

      def initialize(*args)
        super(*args)
      end
      
      def ping
        get 'ping'
      end

      def inspect # :nodoc:
        "<VotoMobile::REST::Client @api_key=#{@auth_token}>"
      end
    end
  end
end
