# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require 'minitest/autorun'
require_relative './rectangle'

# Confirms behavior of Rectangle
class RectangleTest < Minitest::Test

  def test_area
    assert_equal(24, Rectangle.new(4, 6).area)
  end

end
