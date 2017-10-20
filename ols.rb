require "./line"
require "./point"
require "./plot"


50.times do
  Point.new(rand(rand(100)), rand(rand(100)))
end

50.times do
  Point.new(rand(rand(100)), rand(rand(100)))
end

l = Line.new(1.0, 0)

p = OLSPlot.new(800)

100.times do
  puts "PITCH: #{l.pitch}"
  break unless l.come_closer(Point.all)
end

p.write_line(l)

p.write_datapoints(Point.all)
p.write_to_file


