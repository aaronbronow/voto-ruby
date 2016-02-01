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
      list.status = data['code']
      if data['pagination']
        list.next_url = data['pagination']['nextURL']
        list.previous_url = data['pagination']['previousURL']
      end
    end

    def get_data(list, data_name, full_path, params = {})
      path = full_path.nil? ? data_name : full_path
      data = get(path, params, !full_path.nil?)
      try_paginate(data, list)
      list.assign_data(data['data'][data_name])
      list
    end
  end
end
