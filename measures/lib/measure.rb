require_relative 'unit'

# Measure represents the relative values of these silly imperial units
class Measure
  include Comparable

  def initialize(quantity, unit)
    @quantity = quantity
    @unit     = unit
  end

  def ==(other)
    other == value_in_base_unit
  end

  def <=>(other)
    other <=> value_in_base_unit
  end

  def +(other)
    self.class.build(value_in_base_unit + other.value_in_base_unit)
  end

  def -(other)
    self.class.build(value_in_base_unit - other.value_in_base_unit)
  end

  def self.build(quantity)
    Measure.new(quantity, Unit::TEASPOON)
  end

  protected

  def value_in_base_unit
    unit.value_in_base_unit(quantity)
  end

  attr_reader :quantity, :unit

end
