module VotoMobile
  module Subscribers
    def subscribers(path = nil)
      list = SubscribersList.new self, 'subscribers'
      data = path.nil? ? get('subscribers') : get('subscribers', {}, path)
      try_paginate(data, list)
      list.data = data['data']['subscribers']
      list
    end
  end
  
  class SubscribersList < BaseList; end
end
