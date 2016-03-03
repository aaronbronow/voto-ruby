require 'spec_helper'

describe VotoMobile::SurveyResults do

  it 'should fetch survey results' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('surveys/204561/results', 'survey_results')
    data = client.survey_results(204561)
    expect(data).to be_a VotoMobile::SurveyResultsList
    expect(data.list[0]).to be_a VotoMobile::SurveyResult
    expect(data.list.length).to eq 4
  end
end
