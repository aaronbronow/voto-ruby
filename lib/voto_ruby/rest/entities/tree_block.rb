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
                  :response_min,
                  :klass,
                  :details,
                  :language_selector_id,
                  :options,
                  :num_repeats,
                  :max_numeric_digits,
                  :max_open_length,
                  :logic,
                  :question_blocks,
                  :loop_back_method,
                  :action_type,
                  :subscriber_property_id,
                  :subscriber_property_name,
                  :data_value,
                  :group_id,
                  :condition_subscriber_is_in_group,
                  :quota_threshold,
                  :start_date_method,
                  :start_date_input_on_numeric_block_id,
                  :run_tree_id,
                  :choices_locked_in_position,
                  :choices_voice_content

    def interactions
      @client.interactions(@tree_id, @id)
    end

    def question_block?
      type.end_with?(' Question')
    end

    def question_choices
      details['choices']
    end

    def question_title
      details['title']
    end
  end
end
