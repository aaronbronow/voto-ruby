module VotoMobile
  class TreeResult < Entity
    attr_accessor :block_id,
                  :block_type,
                  :block_class,
                  :num_outputs,
                  :is_interactive,
                  :interactions
  end
end
