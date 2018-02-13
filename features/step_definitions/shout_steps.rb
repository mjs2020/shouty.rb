require 'shouty'
require 'coordinate'

ARBITRARY_MESSAGE = "Hello, world"

Before do
  @shouty = Shouty.new
end

Given('{word} is at {int}, {int}') do |name, x, y|
  @shouty.set_location(name, Coordinate.new(x, y))
end

When('{word} shouts') do |name|
  @shouty.shout(name, ARBITRARY_MESSAGE)
end

Then('{word} should hear {word}') do |listener, sender|
  expect(@shouty.shouts_heard_by(listener)).to have_key(sender)
end

Then('{word} should not hear {word}') do |listener, sender |
  expect(@shouty.shouts_heard_by(listener)).not_to have_key(sender)
end

Then('{word} should not hear any shout') do |listener|
  expect(@shouty.shouts_heard_by(listener).size).to eq(0)
end
