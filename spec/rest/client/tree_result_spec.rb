require 'spec_helper'

describe VotoMobile::TreeResult do

  it 'should fetch tree results' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('trees/7/results', 'tree_results')

    data = client.tree_results(7)
    expect(data).to be_a VotoMobile::TreeResultsList
    expect(data.list[0]).to be_a VotoMobile::TreeResult
    expect(data.list.length).to eq 16
  end
end
