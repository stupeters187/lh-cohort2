require_relative 'spec_helper'


describe Unit do
  
  before :each do
    @unit = Unit.new(10, 5)
  end

  describe "#dead?" do

    it "kills unit once it reaches 0 HP" do
      allow(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to eq(true)
    end
  end
end