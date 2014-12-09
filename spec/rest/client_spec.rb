require 'spec_helper'

describe VotoMobile::REST::Client do
  describe 'config at class level' do
    after(:each) do
      VotoMobile.instance_variable_set('@configuration', nil)
    end

    it 'should set the auth token with a config block' do
      VotoMobile.configure do |config|
        config.auth_token = 'someToken'
      end

      client = VotoMobile::REST::Client.new
      expect(client.instance_variable_get('@auth_token')).to eq('someToken')
    end

    it 'should overwrite auth token if passed to initializer' do
      VotoMobile.configure do |config|
        config.auth_token = 'someToken'
      end

      client = VotoMobile::REST::Client.new 'otherToken'
      expect(client.instance_variable_get('@auth_token')).to eq('otherToken')
    end

    it 'should throw an argument error if the token isn\'t set' do
      expect { VotoMobile::REST::Client.new }.to raise_error(ArgumentError)
    end

    it 'should set up a new client instance with the given token' do
      voto = VotoMobile::REST::Client.new('someToken')
      expect(voto.instance_variable_get('@auth_token')).to eq('someToken')
    end

    it 'should set up the proper default http ssl connection' do
      voto = VotoMobile::REST::Client.new('someToken')
      connection = voto.instance_variable_get('@connection')
      expect(connection.address).to eq('go.votomobile.org/api/v1')
      expect(connection.port).to eq(443)
      expect(connection.use_ssl?).to eq(true)
    end

    # [
    #   :sandbox, :available_phone_numbers, :incoming_phone_numbers,
    #   :calls, :outgoing_caller_ids, :conferences, :sms, :recordings,
    #   :transcriptions, :notifications, :applications, :connect_apps,
    #   :authorized_connect_apps, :queues, :usage, :messages, :media, :sip
    # ].each do |method|
    #   it "should delegate the client method #{method} to the account object" do
    #     client = Twilio::REST::Client.new('someSid', 'someToken')
    #     expect(client).to respond_to(method)
    #     expect(client.send(method)).to eq(client.account.send(method))
    #   end
    # end
  end
end