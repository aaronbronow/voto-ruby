require 'spec_helper'

describe VotoMobile::IncomingCalls do

  it 'should fetch incoming calls' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('incoming_calls', 'incoming_calls')
    data = client.incoming_calls
    expect(data).to be_a VotoMobile::IncomingCallsList
    expect(data.list[0]).to be_a VotoMobile::IncomingCall
    expect(data.list.length).to eq 9
  end

  it 'should fetch incoming call counts' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('incoming_calls/200320/counts', 'incoming_call_counts')
    counts = client.incoming_call_counts(200320)
    expect(counts.id).to eq '200320'
    expect(counts.count).to eq 25
  end
end
