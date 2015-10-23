require 'net/http'
require 'net/https'
require 'builder'
require 'openssl'
require 'forwardable'
require 'multi_json'

require 'voto_ruby/version'
require 'voto_ruby/util'
require 'voto_ruby/util/configuration'
require 'voto_ruby/util/request_validator'
require 'voto_ruby/util/capability'
require 'voto_ruby/rest/client'
require 'voto_ruby/rest/errors'

module VotoMobile
  extend SingleForwardable

  def_delegators :configuration, :account_sid, :auth_token

  ##
  # Pre-configure with account SID and auth token so that you don't need to
  # pass them to various initializers each time.
  def self.configure(&block)
    yield configuration
  end

  ##
  # Returns an existing or instantiates a new configuration object.
  def self.configuration
    @configuration ||= Util::Configuration.new
  end
  private_class_method :configuration
end
