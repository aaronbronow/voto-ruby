require 'spec_helper'

describe VotoMobile::Languages do

  it 'should fetch languages' do
    client = VotoMobile::REST::Client.new('someToken')
    stub_voto_request('languages', 'languages')
    data = client.languages
    expect(data).to be_a VotoMobile::LanguagesList
    expect(data.list[0]).to be_a VotoMobile::Language
    expect(data.list.length).to eq 1
  end
end
