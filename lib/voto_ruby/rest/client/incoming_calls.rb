module VotoMobile
  module IncomingCalls
    def incoming_calls(full_path = nil)
      list = IncomingCallsList.new(self, 'incoming_calls')
      get_data(list, 'incoming_calls', full_path)
    end
  end
  
  class IncomingCallsList < BaseList; end
end
