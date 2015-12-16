module VotoMobile
  module Surveys
    def surveys(path = nil)
      list = SurveysList.new self, 'surveys'
      data = path.nil? ? get('surveys') : get('surveys', {}, path)
      try_paginate(data, list)
      list.data = data['data']['surveys']
      list
    end
  end
  
  class SurveysList < BaseList; end
end
