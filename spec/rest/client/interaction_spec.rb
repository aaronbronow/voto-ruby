require 'spec_helper'

describe VotoMobile::Interaction do

  it 'should fetch interactions' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('trees/10/blocks/228/interactions', 'interactions')

    data = client.interactions(10, 228)
    expect(data).to be_a VotoMobile::InteractionList
    expect(data.list[0]).to be_a VotoMobile::Interaction
    expect(data.list.length).to eq 5
  end
end
