require "journey_log"

describe JourneyLog do

  let(:journey){ double :journey, entry_station: station}
  let(:station){ double :station }
  let(:journey_class){double :journey_class, new: journey }
  subject { described_class.new(journey_class: journey_class) }

  describe "#initialize" do
  end

  describe "#start" do
    it "starts a journey" do
      expect(journey_class).to receive(:new).with(entry_station: station)
      subject.start(station)
    end

    it "records a journey" do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(station)
      expect(subject.journeys).to include {station}
    end
  end

  describe "#finish" do

  end

  describe "#journeys" do
  end
end