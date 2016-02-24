require "./square"

# to specify the behaviour of a square
describe Square do

  specify "has an area" do
    square = Rectangle.square(10)

    expect(square.area).to eq 100
  end

  specify "has a perimeter" do
    square = Rectangle.square(10)

    expect(square.perimeter).to eq 40
  end


end
