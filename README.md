# RspecLetLocal

Allow for a more efficient way of creating local variables for an example set.

```ruby
describe 'A test' do
  let_local(:a) { 20 }
end
```
...will define an ivar and call it in a before_all hook.
