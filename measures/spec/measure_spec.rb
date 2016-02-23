require './lib/measure'
require "./lib/fixnum"

describe "Measure" do

  specify "a tablespoon knows its equal to 3 teaspoons" do
    expect(1.tablespoon).to eq 3.teaspoons
  end

  specify "3 teaspoons equals 1 tablespoon" do
    expect(3.teaspoons).to eq 1.tablespoon
  end

  specify "1 ounce equals 2 tablespoons" do
    expect(1.ounce).to eq 2.tablespoons
  end

  describe "more than" do

    specify "3 teaspoons is more than 2 teaspoons" do
      expect(3.teaspoons > 2.teaspoons).to eq true
    end

  end

  describe "less than" do

    specify "2 teaspoons are less than 1 cup" do
      expect(3.teaspoons < 1.cup).to eq true
    end

  end

  describe "addition" do

    specify "when measures are of different type" do
      expect(3.teaspoons + 2.tablespoon).to eq 9.teaspoons
    end

  end

  describe "subtraction" do

    specify "when measures are of different types" do
      expect(2.tablespoon - 1.teaspoons).to eq 5.teaspoons
    end

  end

  describe "invalid comparisons" do

    specify "with nil" do
      expect(3.teaspoons).not_to eq nil
    end

    specify "with another object" do
      expect(1.cup).not_to eq Object.new
    end

  end

end
