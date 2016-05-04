require_relative 'spec_helper'

describe Barracks do
  
  before :each do
    @barracks = Barracks.new
  end

  it "has and knows it has HP (health  points)" do
    expect(@barracks.health_points).to eq(500)
  end
end

describe Footman do

  before :each do
    @footman = Footman.new
    @barracks = Barracks.new
  end

  it "only does half damage to Barracks" do
      @footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495)
  
  end
end
