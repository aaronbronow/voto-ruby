require 'spec_helper'

describe VotoMobile::DeliveryLogs do

  it 'should fetch delivery logs' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('delivery_logs?limit=500', 'delivery_logs')
    check_response(client.delivery_logs)
  end

  it 'should fetch delivery logs by incoming call' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('incoming_calls/1/delivery_logs?limit=500', 'delivery_logs')
    check_response(client.delivery_logs_by_incoming_call(1))
  end

  it 'should fetch delivery logs by survey' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('surveys/1/delivery_logs?limit=500', 'delivery_logs')
    check_response(client.delivery_logs_by_survey(1))
  end

  it 'should fetch delivery logs by tree' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('trees/1/delivery_logs?limit=500', 'delivery_logs')
    check_response(client.delivery_logs_by_tree(1))
  end

  def check_response(data)
    expect(data).to be_a VotoMobile::DeliveryLogsList
    expect(data.list[0]).to be_a VotoMobile::DeliveryLog
    expect(data.list.length).to eq 34
  end
end
