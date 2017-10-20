class Line
  attr_reader :pitch, :height

  def initialize(pitch, height)
    @pitch = pitch
    @height = height
  end

  def x(y)
    (y - height) / pitch
  end

  def y(x)
    x * pitch + height
  end

  def point?(point)
    point.y == point.x * pitch + height
  end
end
