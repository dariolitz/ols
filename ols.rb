require "./line"
require "./point"


100.times do
  Point.new(Random.rand(100), Random.rand(100))
end

l = Line.new(0.5, 2.5)

Point.print_squaresum_to(l)
