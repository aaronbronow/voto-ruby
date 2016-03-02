require 'spec_helper'

describe VotoMobile::Questions do

  it 'should fetch questions' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('surveys/204561/questions', 'questions')
    data = client.questions(204561)
    expect(data).to be_a VotoMobile::QuestionsList
    expect(data.list[0]).to be_a VotoMobile::Question
    expect(data.list.length).to eq 4
  end

  it 'should fetch question counts' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('surveys/204561/questions/219338/counts', 'question_counts_Q1')
    counts = client.question_counts(204561, 219338)
    expect(counts.id).to eq '219338'
    expect(counts.number_of_responses).to eq 33
  end
end
