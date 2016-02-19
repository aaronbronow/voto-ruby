module VotoMobile
  class SurveyCounts < Entity
    attr_accessor :id,
                  :incoming_calls,
                  :complete_calls,
                  :failed_calls,
                  :successful_calls,
                  :first_question_response_count,
                  :last_question_response_count,
                  :test_responses,
                  :questions
  end
end
