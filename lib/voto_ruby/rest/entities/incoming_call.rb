module VotoMobile
  class IncomingCall < Entity
    attr_accessor :id,
                  :title,
                  :message_id,
                  :survey_id,
                  :tree_id,
                  :poll_id,
                  :has_voice,
                  :has_sms,
                  :should_call_back,
                  :override_callback_content_type,
                  :override_callback_sender_id,
                  :confirm_answer_before_callback,
                  :resume_survey_positions_in_same_poll,
                  :handle_incoming_sms_as_first_response,
                  :retry_attempts_short,
                  :retry_delay_short,
                  :retry_attempts_long,
                  :retry_delay_long,
                  :created_at,
                  :updated_at,
                  :webhook

    def delivery_logs
      @client.delivery_logs_by_incoming_call(@id)
    end
  end
end
