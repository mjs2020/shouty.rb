class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance_from(other)
    # TODO: actually calculate distance between the coordinates.
    #       e.g. (@x - other.x).abs
    # Math.sqrt((@x - other.x).abs ** 2 + (@y - other.y).abs ** 2)
    Math.hypot(@x - other.x, @y - other.y)
  end
end
