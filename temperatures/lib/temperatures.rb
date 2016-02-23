
# represents a particular temperature as a number of units
class Reading
  attr_reader :value, :unit
  protected   :value, :unit

  def initialize(value, unit)
    @value, @unit = value, unit
  end

  def ==(other)
    self.value == other.convert_to(self).value
  end

  def convert_to(other)
    unit.convert_to(other.unit, self.value)
  end

end

module Temperature
  # models how a temperature measurement standard converts to other standards
  class Unit

    def initialize(name, &conversion_method)
      @name              = name
      @conversion_method = conversion_method
    end

    def convert_to(other_unit, value)
      return value.send(self.name) if other_unit.is_a? self
      conversion_method.call(value).send(other_unit.name)
    end

    def is_a? other
      self.name == other.name
    end

    protected

    attr_reader :conversion_method, :name
  end

  Celcius = Unit.new(:celcius) do |reading|
    ((reading * 9) / 5) + 32
  end

  Fahrenheit = Unit.new(:fahrenheit) do |reading|
    ((reading - 32) * 5) / 9
  end

end

class Numeric

  def celcius
    Reading.new(self, Temperature::Celcius)
  end

  def fahrenheit
    Reading.new(self, Temperature::Fahrenheit)
  end

end
