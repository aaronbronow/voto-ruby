module VotoMobile
  module SurveyResults
    def survey_results(survey_id = nil)
      list = SurveyResultsList.new self, 'results'
      data = get("surveys/#{survey_id}/results")
      try_paginate(data, list)
      list.assign_data(data['data']['results'])
      list
    end
  end

  class SurveyResultsList < BaseList
    ENTITY = SurveyResult
  end
end
