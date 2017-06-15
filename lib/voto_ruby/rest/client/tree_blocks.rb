module VotoMobile
  module TreeBlocks
    def tree_blocks(tree_id = nil)
      list = TreeBlocksList.new self, 'blocks'
      data = get("trees/#{tree_id}/blocks")
      try_paginate(data, list)
      list.assign_data(data['data']['blocks'], tree_id)
      list
    end
  end

  class TreeBlocksList < BaseList
    ENTITY = TreeBlock

    def assign_data(list, tree_id)
      unless list.length > 0
        @data = []
        return
      end

      @data = list.map { |hash| self.class::ENTITY.new(hash.merge(tree_id: tree_id), @client) }
    end
  end
end
