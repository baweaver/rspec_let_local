# RspecLetLocal

Allow for a more efficient way of creating local variables for an example set.

```ruby
describe 'A test' do
  let_local(:a) { 20 }
end
```
...will define an ivar and call it in a before_all hook.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec_let_local'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec_let_local

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rspec_let_local/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
