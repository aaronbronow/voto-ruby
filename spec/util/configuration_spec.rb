describe VotoMobile::Util::Configuration do
  it 'should have an auth token attribute' do
    config = VotoMobile::Util::Configuration.new
    config.auth_token = 'someToken'
    expect(config.auth_token).to eq('someToken')
  end
end