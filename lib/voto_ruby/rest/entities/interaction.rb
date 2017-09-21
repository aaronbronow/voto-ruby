module VotoMobile
  class Interaction < Entity
    attr_accessor :subscriber_id,
                  :delivery_log_id,
                  :block_interaction_id,
                  :block_id,
                  :block_type,
                  :title,
                  :response,
                  :number_of_repeats,
                  :entry_at,
                  :exit_at

    def value
      response['choice_name'] || response['value']
    end
  end
end
