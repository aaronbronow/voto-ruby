module VotoMobile
  module Subscribers
    def subscribers(full_path = nil)
      list = SubscribersList.new(self, 'subscribers')
      get_data(list, 'subscribers', full_path)
    end
  end
  
  class SubscribersList < BaseList; end
end
