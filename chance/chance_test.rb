# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

require 'minitest/autorun'
require_relative './chance'

# Confirms behavior of Chance
class ChanceTest < Minitest::Test

  IMPOSSIBLE = Chance.new(0)
  UNLIKELY = Chance.new(0.25)
  EQUALLY_LIKELY = Chance.new(0.5)
  LIKELY = Chance.new(0.75)
  CERTAIN = Chance.new(1)

  def test_equality
    assert_equal(Chance.new(0.25), UNLIKELY)
    refute_equal(LIKELY, UNLIKELY)
    refute_equal(LIKELY, Object.new)
    refute_equal(LIKELY, nil)
  end

  def test_not
    assert_equal(UNLIKELY, LIKELY.not)
    assert_equal(CERTAIN, IMPOSSIBLE.not)
    assert_equal(LIKELY, LIKELY.not.not)
  end

  def test_and
    assert_equal(UNLIKELY, EQUALLY_LIKELY.and(EQUALLY_LIKELY))
    assert_equal(IMPOSSIBLE, LIKELY.and(IMPOSSIBLE))
    assert_equal(IMPOSSIBLE, IMPOSSIBLE.and(LIKELY))
    assert_equal(Chance.new(0.1875), LIKELY.and(UNLIKELY))
  end

  def test_valid_range
    assert_raises(Exception) { Chance.new(-0.1) }
    assert_raises(Exception) { Chance.new(1.1) }
  end

end