require 'gruffy'

class OLSPlot < Gruffy::Scatter

  attr_accessor :cluster_center_points
  @@line_counter = 0

  def initialize(cc)
    super(cc)
    @data = []
    @marker_font_size = 10.0
    @file = 'output/graph.png'
  end

  def write_to_file(out = @file)
    @file = out
    write(@file)
  end

  def open_file
    `xdg-open #{@file}`
  end

  def write_datapoints(points)
    data("data_points", get_x_values(points), get_y_values(points))
  end

  def write_line(line)
    min = 0
    max = 30
    i = min
    y_values = []
    x_values = []
    puts line.pitch
    while i <= max do
      y_value = (i * line.pitch) + line.height
      y_values << y_value
      x_values << line.x(y_value)
      i += 0.5
    end

    data("line_#{@@line_counter}", x_values, y_values)
    @@line_counter += 1
  end

  private

  def get_x_values(points)
    x_values = []
    points.each do |p|
      x_values << p.x
    end
    x_values
  end

  def get_y_values(points)
    y_values = []
    points.each do |p|
      y_values << p.y
    end
    y_values
  end
end
