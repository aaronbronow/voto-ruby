require 'spec_helper'

describe VotoMobile::Tree do

  it 'should fetch trees' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('trees', 'trees')
    data = client.trees
    expect(data).to be_a VotoMobile::TreesList
    expect(data.list[0]).to be_a VotoMobile::Tree
    expect(data.list.length).to eq 2
  end
end
