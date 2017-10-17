module VotoMobile
  module TreeBlocks
    def tree_blocks(tree_id = nil)
      list = TreeBlocksList.new self, 'blocks'
      data = get("trees/#{tree_id}/blocks")
      try_paginate(data, list)
      list.assign_data(data['data']['blocks'])
      list
    end
  end

  class TreeBlocksList < BaseList
    ENTITY = TreeBlock
  end
end
