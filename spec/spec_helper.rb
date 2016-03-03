require 'bundler'
Bundler.setup

require 'coveralls'
Coveralls.wear!

require 'pry'
require 'voto_ruby'
require 'voto_helpers'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include VotoHelpers
  config.before(:suite) do
    WebMock.disable_net_connect!
  end
  config.after(:suite) do
    WebMock.allow_net_connect!
  end
end
