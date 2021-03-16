# IPIP fast !

Same function as [ipip-ipdb](https://github.com/ipipdotnet/ipdb-ruby), only faster

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ipip-fast'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ipip-fast

## Usage

```ruby
require "ipdb-fast"

db = IPDB.city "c:/work/ipdb/city.ipv4.ipdb"
loc = db.find "1.1.1.1", "CN"
puts loc
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Eric-Guo/ipip-fast.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
