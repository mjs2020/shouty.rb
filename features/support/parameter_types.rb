require 'coordinate'

ParameterType(
    regexp: /(\d+), (\d+)/,
    transformer: -> (x,y) { Coordinate.new(x.to_i, y.to_i)},
    type: Coordinate,
    name: 'coordinate',
    use_for_snippets: true,
    prefer_for_regexp_match: false
)