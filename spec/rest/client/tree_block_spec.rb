require 'spec_helper'

describe VotoMobile::TreeBlock do

  it 'should fetch tree blocks' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('trees/7/blocks', 'tree_blocks')

    data = client.tree_blocks(7)
    expect(data).to be_a VotoMobile::TreeBlocksList
    expect(data.list[0]).to be_a VotoMobile::TreeBlock
    expect(data.list.length).to eq 16
  end
end
