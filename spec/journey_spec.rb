require 'journey'

describe Journey do
  subject { described_class.new(entry_station: "test station") }

  describe "#initialize" do
    it "sets journey_status to in journey" do
      expect(subject.journey_status).to eq "in journey"
    end

    it "sets entry_station to initialized station" do
      expect(subject.entry_station).to eq "test station"
    end

    it "sets exit_station to nil" do
      expect(subject.exit_station).to eq nil
    end

  end
  

  describe "#end_journey" do
    it "sets journey_status to nil" do
      expect { subject.end_journey(exit_station: "test_exit") }.to change {subject.journey_status }.from("in journey").to(nil)
    end

  end


  describe "#journey?" do
    it "returns journey_status" do
      expect(subject.journey?).to eq subject.journey_status
    end

  end


  describe "#complete?" do
    it "knows if a journey is not complete" do
      expect(subject).not_to be_complete
    end
  
    it "knows if a journey is complete" do
      subject.end_journey(exit_station: "test_exit")
      expect(subject).to be_complete
    end

  end


  describe "#fare" do
    it "returns minimum fare when journey is complete" do
      subject.end_journey(exit_station: "test_exit")
      expect(subject.fare).to eq 1
    end

  end

end