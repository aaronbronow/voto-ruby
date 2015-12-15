# VotoRuby

[![Build Status](https://travis-ci.org/votomobile/voto-ruby.svg?branch=master)](https://travis-ci.org/votomobile/voto-ruby) 

A module for using the VOTO Mobile REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'voto_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install voto_ruby

## Usage

Read the [https://go.votomobile.org/apidoc/](VOTO Mobile API documentation).

###Authentication
All API requests must authenticate by posting an organization’s API Key.

You can request an API Key for a new account by contacting support@votomobile.org. To look up your API Key, visit https://go.votomobile.org/settings#apiSettings

The parameter ‘api_key’ can be included as a parameter with every GET or POST request. HTTPS is used to protect the security of API keys.

The ‘api_key’ can also be posted in the header of the request.

###Client

```client = VotoMobile::REST::Client.new '#{api_key}'```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/voto_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
