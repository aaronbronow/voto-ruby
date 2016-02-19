module VotoMobile
  class QuestionCounts < Entity
    attr_accessor :id,
                  :title,
                  :survey_id,
                  :question_number,
                  :num_choices,
                  :response_type,
                  :is_conditional,
                  :max_numeric_digits,
                  :number_of_respondents,
                  :number_of_responses,
                  # below are fields which are set in case use of filters
                  :filter_after_date,
                  :filter_before_date
  end
end
