require 'spec_helper'

describe VotoMobile do
  after(:each) do
    VotoMobile.instance_variable_set('@configuration', nil)
  end

  it 'should set the auth token with a config block' do
    VotoMobile.configure do |config|
      config.auth_token = 'someToken'
    end

    expect(VotoMobile.auth_token).to eq('someToken')
  end

  # context 'set up a client to talk to the VOTO Mobile REST API' do
  #   it 'connects to the API using given credentials' do
  #     @client = VotoMobile::REST::Client.new '1234'
  #   end
  # end
  # context 'manage subscribers' do
  #   xit 'adds a subscriber'
  #   xit 'removes a subscriber'
  # end
  # context 'manage messages' do
  #   xit 'sends a message'
  # end

end