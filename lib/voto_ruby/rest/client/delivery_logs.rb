module VotoMobile
  module DeliveryLogs
    DEFAULTS = {
        limit: 500
    }
    def delivery_logs(full_path = nil)
      list = DeliveryLogsList.new(self, 'delivery_logs')
      get_data(list, 'delivery_logs', full_path, { limit: DEFAULTS[:limit] })
    end
    
    def delivery_logs_by_incoming_call(id, filters = {})
      list = DeliveryLogsList.new(self, 'delivery_logs')
      path = "incoming_calls/#{id}/delivery_logs"
      data = get(path, { limit: DEFAULTS[:limit] }.merge(filters))
      try_paginate(data, list)
      list.assign_data(data['data']['delivery_logs'])
      list
    end

    def delivery_logs_by_survey(survey_id, filters = {})
      list = DeliveryLogsList.new(self, 'delivery_logs')
      path = "surveys/#{survey_id}/delivery_logs"
      data = get(path, { limit: DEFAULTS[:limit] }.merge(filters))
      try_paginate(data, list)
      list.assign_data(data['data']['delivery_logs'])
      list
    end
  end

  class DeliveryLogsList < BaseList
    ENTITY = DeliveryLog
  end
end
