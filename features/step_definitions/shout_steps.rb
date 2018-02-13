require 'shouty'
require 'coordinate'

ARBITRARY_MESSAGE = 'Hello, world'

When('{word} shouts') do |name|
  @shouty.shout(name, ARBITRARY_MESSAGE)
end

Then('{word} should hear {word}') do |listener, sender|
  if sender == 'nothing'
    expect(@shouty.shouts_heard_by(listener).size).to eq(0)
  else
    expect(@shouty.shouts_heard_by(listener)).to have_key(sender)
  end
end

Then('{word} should not hear {word}') do |listener, sender |
  expect(@shouty.shouts_heard_by(listener)).not_to have_key(sender)
end

Then('{word} should hear {int} shouts from {word}') do |listener, shouts_num, sender|
  expect(@shouty.shouts_heard_by(listener)).to have_key(sender)
  expect(@shouty.shouts_heard_by(listener)[sender].size).to eq(shouts_num)
end