module VotoMobile
  module TreeResults
    def tree_results(survey_id = nil)
      list = TreeResultsList.new self, 'results'
      data = get("trees/#{survey_id}/results")
      try_paginate(data, list)
      list.assign_data(data['data']['results'])
      list
    end
  end

  class TreeResultsList < BaseList
    ENTITY = TreeResult
  end
end
