require "./lib/temperatures"

RSpec.describe "Temperature conversions" do

  specify "knows that 10c equals 50f" do
    expect(10.celcius).to eq 50.fahrenheit
  end

  specify "knows that 50f equals 10c" do
    expect(10.celcius).to eq 50.fahrenheit
  end

  specify "knows that 10c equals 10c" do
    expect(10.celcius).to eq 10.celcius
  end
end
