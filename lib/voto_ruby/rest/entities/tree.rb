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

    def num_questions
      @num_questions ||= num_blocks.to_i > 0 ? blocks.list.count { |block| block.question_block? } : 0
    end

    def is_tree
      true
    end
  end
end
