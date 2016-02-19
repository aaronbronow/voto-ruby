module VotoMobile
  module Surveys
    def surveys(full_path = nil)
      list = SurveysList.new(self, 'surveys')
      get_data(list, 'surveys', full_path)
    end

    def survey_counts(survey_id, filters = {})
      total_data = get("surveys/#{survey_id}/counts", filters)['data']
      complete_data = get("surveys/#{survey_id}/counts", { filter_delivery_status: 6 }.merge(filters))['data']
      failed_data = get("surveys/#{survey_id}/counts", { filter_delivery_status: 7 }.merge(filters))['data']
      survey_result = survey_results(survey_id)
      first_question_response_count = 0
      last_question_response_count = 0
      test_responses = 0
      questions = []

      survey_result.list.each do |result|
        question_count = question_counts(survey_id, result.question_id, filters)
        questions << question_count

        if result.question_number.to_i == 1
          first_question_response_count = question_count.number_of_responses

          # check test responses
          question_results = responses_by_question(survey_id, result.question_id, filters)
          question_results.list.each do |question_result|
            if question_result.numeric_response &&
                (question_result.numeric_response == '9999' || question_result.numeric_response == '1234')
              test_responses += 1
            end
          end
        end

        if result.question_number.to_i == survey_result.list.length
          last_question_response_count = question_count.number_of_responses
        end
      end

      SurveyCounts.new({ id: total_data['survey_id'],
                         incoming_calls: total_data['count'],
                         complete_calls: complete_data['count'],
                         failed_calls: failed_data['count'],
                         successful_calls: complete_data['count'] + failed_data['count'],
                         first_question_response_count: first_question_response_count,
                         last_question_response_count: last_question_response_count,
                         test_responses: test_responses,
                         questions: questions }, self)
    end
  end

  class SurveysList < BaseList
    ENTITY = Survey
  end
end
