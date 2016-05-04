require_relative 'spec_helper'

describe SiegeEngine do

  before :each do 
    @siege = SiegeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege.attack_power).to eq(50)
  end
end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#train_siege_engine" do

    it "costs 200 gold" do
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800)
    end

    it "costs 60 lumber" do
      @barracks.train_siege_engine
      expect(@barracks.lumber).to eq(440)
    end

    it "costs 3 food" do
      @barracks.train_siege_engine
      expect(@barracks.food).to eq(77)
    end

    it "produces a siege engine unit" do
      siege_engine = @barracks.train_siege_engine
      expect(siege_engine).to be_an_instance_of(SiegeEngine)
    end
  end

  describe "#attack!" do

  end
end