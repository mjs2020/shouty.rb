Given('{word} is at {coordinate}') do |name, coordinate|
  @shouty.set_location(name, coordinate)
end

Given('people are located at') do |table|
  table.hashes.each do | row |
    @shouty.set_location(row['name'], Coordinate.new(row['x'].to_i, row['y'].to_i))
  end
end