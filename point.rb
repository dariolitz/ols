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

  def self.squaresum_to(line)
    sum = 0
    @@instances.each do |i|
      sum += i.square_to(line)
    end
    sum
  end

  def self.print_squaresum_to(line)
    puts "Squaresum: #{squaresum_to(line)}"
  end

  def distance_to(point)
    x_dist = x - point.x
    y_dist = y - point.y
    Math.sqrt((x_dist**2) + (y_dist**2))
  end

  def square_to(line)
    (line.y(@x) - @y)**2
  end

end
