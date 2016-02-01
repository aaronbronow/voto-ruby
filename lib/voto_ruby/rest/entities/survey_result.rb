module VotoMobile
  class SurveyResult < Entity
    attr_accessor :question_id,
                  :question_title,
                  :question_number,
                  :response_type,
                  :total_responses,
                  :choice_responses,
                  :total_voice_responses,
                  :total_text_responses,
                  :average_audio_length,
                  :total_audio_length,
                  :average_audio_lengh,
                  :total_audio_lengh
  end
end
