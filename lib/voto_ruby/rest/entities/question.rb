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

    def responses
      @client.responses_by_question(@survey_id, @id)
    end
  end
end
