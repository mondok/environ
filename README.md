# Environ

Environ is a Ruby gem that lets you access environment variables in an object oriented manner.  Instead of using `ENV['VARIABLE']`, Environ lets you do `Environ.env_variable`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'environ'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install environ

## Usage

Let's say you want to access the PATH variable.  You could do:

    ENV['PATH']

With Environ, you can access it OOP style with:

    Environ.env_path
    
You can also access all the keys in the environment with:

    Environ.all

This will return a hash of all the environment variables.

Finally, Environ respects accessing variables that may not be set.  If you call something like `Environ.env_doesnt_exist` it will return nil rather than throw an exception.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/environ/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
