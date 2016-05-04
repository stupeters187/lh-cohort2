require_relative 'spec_helper'

describe Unit do
  
  before :each do 
    @unit = Unit.new(10, 5)
    @unit2 = Unit.new(10, 5)
  end

  it "cannot attack another unit" do
    allow(@unit2).to receive(:health_points).and_return(0)
    expect(@unit.attack!(@unit2)).to eq (false)
  end

end