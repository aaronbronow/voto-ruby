module VotoMobile
  class Tree < Entity
    attr_accessor :id,
                  :title,
                  :description,
                  :has_voice,
                  :has_sms,
                  :has_ussd,
                  :starting_block_id,
                  :is_interactive,
                  :num_blocks,
                  :created_at,
                  :updated_at

    def blocks
      @client.tree_blocks(@id)
    end

    def results
      @client.tree_results(@id)
    end
  end
end
