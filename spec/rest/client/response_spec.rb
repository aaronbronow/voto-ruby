require 'spec_helper'

describe VotoMobile::Responses do

  it 'should fetch responses by question' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('surveys/204561/questions/219338/results', 'responses')
    data = client.responses_by_question(204561, 219338)
    check_response(data, 33)
  end

  it 'should fetch responses by delivery log' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('surveys/204561/delivery_logs/219338', 'delivery_log')
    data = client.responses_by_delivery_log(204561, 219338)
    check_response(data, 2)
  end

  def check_response(data, length)
    expect(data).to be_a VotoMobile::ResponsesList
    expect(data.list[0]).to be_a VotoMobile::Response
    expect(data.list.length).to eq length
  end
end
