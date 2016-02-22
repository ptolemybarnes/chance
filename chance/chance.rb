# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

# Understands likelihood of a specific outcome
class Chance
  attr_reader :likelihood
  protected :likelihood

  CERTAIN_FRACTION = 1.0

  def initialize(likelihood_as_fraction)
    raise "Value must be between 0 and 1 inclusive" if 
        likelihood_as_fraction < 0 || likelihood_as_fraction > CERTAIN_FRACTION
    @likelihood = likelihood_as_fraction
  end

  def ==(other)
    return false unless other.is_a? Chance
    self.likelihood == other.likelihood 
  end

  def not
    Chance.new(CERTAIN_FRACTION - @likelihood)
  end

  def and(other)
    Chance.new(self.likelihood * other.likelihood)
  end

end