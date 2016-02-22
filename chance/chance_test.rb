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
    assert_equal(UNLIKELY, ~LIKELY)
    assert_equal(CERTAIN, ~IMPOSSIBLE)
    assert_equal(LIKELY, ~~LIKELY)
  end

  def test_and
    assert_equal(UNLIKELY, EQUALLY_LIKELY & EQUALLY_LIKELY)
    assert_equal(IMPOSSIBLE, LIKELY & IMPOSSIBLE)
    assert_equal(IMPOSSIBLE, IMPOSSIBLE & LIKELY)
    assert_equal(Chance.new(0.1875), LIKELY & UNLIKELY)
  end

  def test_valid_range
    assert_raises(Exception) { Chance.new(-0.1) }
    assert_raises(Exception) { Chance.new(1.1) }
  end

  def test_or
    assert_equal(LIKELY, EQUALLY_LIKELY | EQUALLY_LIKELY)
    assert_equal(CERTAIN, CERTAIN | LIKELY)
    assert_equal(CERTAIN, LIKELY | CERTAIN)
    assert_equal(Chance.new(0.8125), LIKELY | UNLIKELY)
  end

end