module VotoMobile
  module IncomingCalls
    def incoming_calls(full_path = nil)
      list = IncomingCallsList.new(self, 'incoming_calls')
      get_data(list, 'incoming_calls', full_path)
    end

    def incoming_call_counts(incoming_call_id, filters = {})
      data = get("incoming_calls/#{incoming_call_id}/counts", filters)['data']
      IncomingCallCounts.new({ id: data['incoming_call_id'],
                               count: data['count'] }, self)
    end
  end

  class IncomingCallsList < BaseList
    ENTITY = IncomingCall
  end
end
