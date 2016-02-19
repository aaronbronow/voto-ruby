module VotoMobile
  module Questions
    def questions(survey_id = nil)
      list = QuestionsList.new self, 'questions'
      data = get("surveys/#{survey_id}/questions")
      try_paginate(data, list)
      list.assign_data(data['data']['questions'])
      list
    end

    def question_counts(survey_id, question_id, filters = {})
      data = get("surveys/#{survey_id}/questions/#{question_id}/counts", filters)['data']
      question = data['question']
      QuestionCounts.new(data.tap { |hs| hs.delete('question') }.merge(question), self)
    end
  end

  class QuestionsList < BaseList
    ENTITY = Question
  end
end
