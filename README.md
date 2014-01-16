# RspecLetLocal

Allow for a more efficient way of creating local variables for an example set.

```ruby
describe 'A test' do
  let_local(:a) { 20 }
end
```
...will define an ivar and call it in a before_all hook.

## ...why?

Why would I want to do something like this? Let behaves very deceptively, in that it will only memoize its' value across a single example, and continually reload it thereafter. For some this seems convenient, but excessive use of let covers fragile tests and creates unnecessary overhead for the sole sake of being able to freely mutate test data.

When tests are written well (read: no mutation, functional style), the behavior of let is completely overkill and unnecessary. As the only solid arguments for let result from writing tests poorly, it would be prudent to avoid altogether in favor of writing more robust tests.

## What benefits does that style even bring?

Killing the overhead of let will make your tests faster, no doubt. As far as how much, that's dependant on the ubiquity of it in your tests.

While not fully proven, it would seem that let introduces race conditions with itself when tests are run in parallel. More evidence is needed to substantiate this claim.

As functional code is, by nature, stateless, you can run tests in parallel with no problems whatsoever. This will account for an immense speed gain by a multiple of roughly the number of cores your computer can use for it.

Noted that this will be considered as heresy by most RSPEC practitioners, more evidence will be needed to make a solid claim.

