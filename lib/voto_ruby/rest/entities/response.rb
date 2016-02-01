module VotoMobile
  class Response < Entity
    attr_accessor :id,
                  :response_type,
                  :date_received,
                  :question_id,
                  :poll_id,
                  :delivery_log_id,
                  :choice_id,
                  :choice_name,
                  :subscriber
  end
end
