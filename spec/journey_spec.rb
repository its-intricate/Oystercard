require 'journey'

RSpec.describe Journey do
  context "fares" do
    it "gives min fare when touch in and out" do
      station1 = Station.new("London Bridge", 1)
      station2 = Station.new("Charing Cross", 1)
      subject.entry_station = station1
      subject.exit_station = station2
      expect(subject.fare).to eq Journey::MIN_FARE
    end
    it "gives penalty fare when missed touch in or touch out" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  context "completed journeys" do


  end

  context "entry and exit stations" do


  end

end
