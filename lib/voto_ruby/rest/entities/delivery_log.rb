module VotoMobile
  class DeliveryLog < Entity
    attr_accessor :id,
                  :incoming_call_id,
                  :outgoing_call_id,
                  :seconds_completed,
                  :message_seconds_total,
                  :retried_times,
                  :start_timestamp,
                  :end_timestamp,
                  :message_start_timestamp,
                  :message_end_timestamp,
                  :message_percent_listened,
                  :survey_questions_answered,
                  :survey_questions_total,
                  :total_call_attempts,
                  :last_call_attempt,
                  :survey_id,
                  :message_id,
                  :tree_id,
                  :subscriber_id,
                  :language_id,
                  :phone,
                  :survey,
                  :message,
                  :subscriber

    def responses
      @client.responses_by_delivery_log(@survey_id, @id)
    end
  end
end
