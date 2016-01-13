module VotoMobile
  module Util
    def url_encode(hash)
      hash.to_a.map {|p| p.map {|e| get_string(e)}.join '='}.join '&'
    end

    def get_string(obj)
      if obj.respond_to?(:strftime)
        obj.strftime('%Y-%m-%d')
      else
        URI.encode obj.to_s
      end
    end
    
    def try_paginate(data, list)
      if data['pagination']
        list.next_url = data['pagination']['nextURL']
        list.previous_url = data['pagination']['previousURL']
      end
    end
  end
end