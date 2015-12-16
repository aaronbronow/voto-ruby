module VotoMobile
  module IncomingCalls
    def incoming_calls(path = nil)
      list = IncomingCallsList.new self, 'incoming_calls'
      data = path.nil? ? get('incoming_calls') : get('incoming_calls', {}, path)
      try_paginate(data, list)
      list.data = data['data']['incoming_calls']
      list
    end
  end
  
  class IncomingCallsList < BaseList; end
end
