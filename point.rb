class Point
  @@instances = []
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @@instances << self
  end

  def self.all
    @@instances
  end

  def distance_to(point)
    x_dist = x - point.x
    y_dist = y - point.y
    Math.sqrt((x_dist**2) + (y_dist**2))
  end

end
