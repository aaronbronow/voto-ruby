module VotoMobile
  module Surveys
    def surveys(full_path = nil)
      list = SurveysList.new(self, 'surveys')
      get_data(list, 'surveys', full_path)
    end
  end

  class SurveysList < BaseList
    ENTITY = Survey
  end
end
