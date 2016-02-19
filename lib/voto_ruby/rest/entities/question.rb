module VotoMobile
  class Question < Entity
    attr_accessor :id,
                  :title,
                  :survey_id,
                  :response_type,
                  :webhook_enabled,
                  :question_number,
                  :max_open_length,
                  :num_choices,
                  :options,
                  :audio_files,
                  :sms_content

    def responses(filters = {})
      @client.responses_by_question(@survey_id, @id, filters)
    end

    def counts(filters = {})
      @client.question_counts(@survey_id, @id, filters)
    end
  end
end
