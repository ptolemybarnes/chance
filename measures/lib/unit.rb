# Represents a quantity in the base value of teaspoons
class Unit

  def self.build(name, quantity)
    unit = Unit.new(quantity)
    Numeric.send(:define_method, name) do
      Measure.new(self, unit)
    end
    Numeric.send(:alias_method, name.to_s + "s", name)
    unit
  end

  def initialize(quantity_in_base_unit)
    @quantity_in_base_unit = quantity_in_base_unit
  end

  def value_in_base_unit(quantity)
    quantity_in_base_unit * quantity
  end

  TEASPOON   = Unit.build(:teaspoon,   1)
  TABLESPOON = Unit.build(:tablespoon, 3)
  OUNCE      = Unit.build(:ounce,      6)
  CUP        = Unit.build(:cup,       48)

  private

  attr_reader :quantity_in_base_unit
end
