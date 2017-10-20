class Line
  attr_reader :pitch, :height, :sensitivity

  def initialize(pitch, height)
    @pitch = pitch
    @height = height
    @sensitivity = 10.0
    @last_move = "none"
  end

  def x(y)
    pitch != 0 ? (y - height) / pitch : 0
  end

  def y(x)
    pitch != 0 ? x * pitch + height : 0
  end

  def point?(point)
    point.y == point.x * pitch + height
  end

  def come_closer(points)
    higher_line = Line.new(higher_pitch, @height)
    lower_line = Line.new(lower_pitch, @height)

    puts "Higher_sqr: #{higher_line.squaresum_to(points)}\nLower_sqr: #{lower_line.squaresum_to(points)}"

    if higher_line.squaresum_to(points) < lower_line.squaresum_to(points)
      move_up
      @sensitivity /= 2 unless @last_move == "higher"
      @last_move = "higher"
    elsif higher_line.squaresum_to(points) > lower_line.squaresum_to(points)
      move_down
      @sensitivity /= 2 unless @last_move == "lower"
      @last_move = "lower"
    else
      false
    end
  end

  def move_up
    @pitch = higher_pitch
  end

  def move_down
    @pitch = lower_pitch
  end

  def higher_pitch
    @pitch + @sensitivity
  end

  def lower_pitch
    @pitch - @sensitivity
  end

  def square_to(point)
    (y(point.x) - point.y)**2
  end

  def squaresum_to(points)
    sum = 0
    points.each do |p|
      sum += square_to(p)
    end
    sum
  end
end
