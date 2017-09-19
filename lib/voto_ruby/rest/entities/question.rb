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
                  :sms_content,
                  :max_numeric_digits

    def responses(filters = {})
      @client.responses_by_question(@survey_id, @id, filters)
    end

    def counts(filters = {})
      @client.question_counts(@survey_id, @id, filters)
    end

    def question_choices
      options
    end

    def question_title
      title
    end
  end
end
