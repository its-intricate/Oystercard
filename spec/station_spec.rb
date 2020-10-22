require 'station'

RSpec.describe Station do
station = Station.new("London Bridge", 2)

  describe "#displays station details" do
    it "displays station name" do
      expect(station.name).to eq "London Bridge"
    end

    it "displays station zone" do
      expect(station.zone).to eq 2
    end

  end

end
