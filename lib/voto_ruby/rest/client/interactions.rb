module VotoMobile
  module Interactions
    def interactions(tree_id, block_id, filters={})
      list = InteractionList.new self, 'interactions'
      data = get("trees/#{tree_id}/blocks/#{block_id}/interactions", filters)
      try_paginate(data, list)
      list.assign_data(data['data']['interactions'])
      list
    end
  end

  class InteractionList < BaseList
    ENTITY = Interaction
  end
end
