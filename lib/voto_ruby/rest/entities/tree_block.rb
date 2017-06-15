module VotoMobile
  class TreeBlock < Entity
    attr_accessor :id,
                  :tree_id,
                  :type,
                  :num_outputs,
                  :is_interactive,
                  :title,
                  :choices,
                  :choices_key_press_options,
                  :choices_sms_response_options,
                  :repeat_enabled,
                  :repeat_times,
                  :repeat_key,
                  :repeat_delay_seconds,
                  :branching_enabled,
                  :audio_files,
                  :sms_content,
                  :connections_to_block,
                  :connections_from_block,
                  :response_std,
                  :response_max,
                  :response_min

    def interactions
      @client.interactions(@tree_id, @id)
    end
  end
end
