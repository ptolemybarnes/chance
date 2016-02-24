# Understands a four-sided polygon with sides at right angles
class Rectangle

  def initialize(length, width)
    raise "Dimension cannot be negative" unless length >= 0 && width >= 0
    @length, @width = length, width
  end

  def area
    length * width
  end

  def perimeter
    2 * (length + width)
  end

  def square?
    length == width
  end

  def self.square(size)
    new(size, size)
  end

  private

  attr_reader :length, :width

end
