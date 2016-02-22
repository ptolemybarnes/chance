# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require 'minitest/autorun'
require_relative './chance'

# Confirms behavior of Chance
class ChanceTest < Minitest::Test

  def test_equality
    assert_equal(Chance.new(0.25), Chance.new(0.25))
    refute_equal(Chance.new(0.74), Chance.new(0.25))
    refute_equal(Chance.new(0.74), Object.new)
    refute_equal(Chance.new(0.74), nil)
  end

end