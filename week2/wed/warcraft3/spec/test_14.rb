require_relative 'spec_helper'


describe Barracks do
  
  before :each do 
    @barracks = Barracks.new
  end

  it "has and knows it has lumber equal to 500" do
    expect(@barracks.lumber).to eq (500)
  end

end