module VotoMobile
  module DeliveryLogs
    DEFAULTS = {
      limit: 500
    }
    def delivery_logs(path = nil)
      list = DeliveryLogsList.new self, 'delivery_logs'
      query = "delivery_logs"
      data = path.nil? ? get(query, {'limit'=>DEFAULTS[:limit]}) : get(path, {'limit'=>DEFAULTS[:limit]}, true)
      try_paginate(data, list)
      list.data = data['data']['delivery_logs']
      list
    end
    
    def delivery_logs_by_incoming_call(id, path=nil)
      list = DeliveryLogsList.new self, 'delivery_logs'
      query = "incoming_calls/#{id}/delivery_logs"
      data = path.nil? ? get(query, {'limit'=>DEFAULTS[:limit]}) : get(path, {'limit'=>DEFAULTS[:limit]}, true)
      try_paginate(data, list)
      list.data = data['data']['delivery_logs']
      list
    end
  end
  
  class DeliveryLogsList < BaseList; end
end
