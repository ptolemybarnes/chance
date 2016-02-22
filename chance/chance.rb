# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

# Understands likelihood of a specific outcome
class Chance
  attr_reader :likelihood
  protected :likelihood

  def initialize(likelihood_as_fraction)
    @likelihood = likelihood_as_fraction
  end

  def ==(other)
    return false unless other.is_a? Chance
    self.likelihood == other.likelihood 
  end

end