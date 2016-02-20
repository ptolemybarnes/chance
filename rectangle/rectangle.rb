# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

# Understands a four-sided polygon with sides at right angles
class Rectangle

  def initialize(length, width)
    @length, @width = length, width
  end
  
  def area
    @length * @width
  end
  
end
