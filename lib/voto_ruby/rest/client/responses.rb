module VotoMobile
  module Responses
    def responses_by_question(survey_id, question_id)
      list = ResponsesList.new self, 'responses'
      data = get("surveys/#{survey_id}/questions/#{question_id}/results")
      try_paginate(data, list)
      list.assign_data(data['data']['responses'])
      list
    end

    def responses_by_delivery_log(survey_id, delivery_log_id)
      list = ResponsesList.new self, 'responses'
      data = get("surveys/#{survey_id}/delivery_logs/#{delivery_log_id}")
      try_paginate(data, list)
      list.assign_data(data['data'])
      list
    end
  end

  class ResponsesList < BaseList
    ENTITY = Response

    def assign_data(list)
      unless list.length > 0
        @data = []
        return
      end

      data = []
      if list.kind_of?(Array)
        # responses by question
        list.each { |hash| data << ENTITY.new(hash, @client) }
      else
        # responses by delivery log
        list['questions'].each do |question|
          next if question['response'].nil?
          attrs = { response_type: question['response_type'],
                    date_received: question['response']['created_at'],
                    question_id: question['id'],
                    delivery_log_id: list['delivery_log']['id'],
                    choice_id: question['response']['choice_id'],
                    choice_name: question['response']['choice_name'],
                    subscriber: { id: list['delivery_log']['subscriber_id']} }
          data << ENTITY.new(attrs, @client)
        end
      end
      @data = data
    end
  end
end
