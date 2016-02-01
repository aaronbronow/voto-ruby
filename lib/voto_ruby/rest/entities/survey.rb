module VotoMobile
  class Survey < Entity
    attr_accessor :id,
                  :has_voice,
                  :has_sms,
                  :title,
                  :num_questions,
                  :repeat_times,
                  :response_timeout,
                  :subscribers_answered,
                  :questions_answered,
                  :has_conclusion,
                  :has_introduction,
                  :webhook_url,
                  :webhook_method,
                  :webhook_secret,
                  :created_at,
                  :updated_at

    def results
      @client.survey_results(@id)
    end

    def questions
      @client.questions(@id)
    end

    def delivery_logs
      @client.delivery_logs_by_survey(@id)
    end
  end
end
