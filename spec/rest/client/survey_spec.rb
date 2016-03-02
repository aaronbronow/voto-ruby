require 'spec_helper'

describe VotoMobile::Surveys do

  it 'should fetch surveys' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('surveys', 'surveys')
    data = client.surveys
    expect(data).to be_a VotoMobile::SurveysList
    expect(data.list[0]).to be_a VotoMobile::Survey
    expect(data.list.length).to eq 9
  end

  it 'should fetch survey counts' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('surveys/204561/counts', 'survey_counts')
    stub_voto_request('surveys/204561/counts?filter_delivery_status=6', 'survey_complete_counts')
    stub_voto_request('surveys/204561/counts?filter_delivery_status=7', 'survey_failed_counts')
    stub_voto_request('surveys/204561/results', 'survey_results')
    stub_voto_request('surveys/204561/questions/219338/results', 'responses')
    stub_voto_request('surveys/204561/questions/219338/counts', 'question_counts_Q1')
    stub_voto_request('surveys/204561/questions/219339/counts', 'question_counts_Q2')
    stub_voto_request('surveys/204561/questions/219340/counts', 'question_counts_Q3')
    stub_voto_request('surveys/204561/questions/219341/counts', 'question_counts_Q4')

    counts = client.survey_counts(204561)
    expect(counts.id).to eq '204561'
    expect(counts.incoming_calls).to eq 69
    expect(counts.complete_calls).to eq 24
    expect(counts.failed_calls).to eq 39
    expect(counts.successful_calls).to eq 63
    expect(counts.first_question_response_count).to eq 33
    expect(counts.last_question_response_count).to eq 24
    expect(counts.test_responses).to eq 0
    expect(counts.questions.length).to eq 4
  end
end
