require 'journey'

describe Journey do

  describe "#initialize" do
    it "sets journey_status to nil" do
      expect(subject.journey_status).to eq nil
    end

    it "sets entry_station to nil" do
      expect(subject.entry_station).to eq nil
    end

    it "sets exit_station to nil" do
      expect(subject.exit_station).to eq nil
    end
  end

  
  describe "#start_journey" do
    it "sets journey_status to in journey" do
      expect { subject.start_journey }.to change { subject.journey_status }.from(nil).to("in journey")
    end
  end
  
  describe "#end_journey" do
    it "sets journey_status to nil" do
      subject.start_journey
      expect { subject.end_journey }.to change {subject.journey_status }.from("in journey").to(nil)
    end
  end

  describe "#journey?" do
    it "returns journey_status" do
      expect(subject.journey?).to eq subject.journey_status
    end
  end

  describe "#entry_point" do
    let (:entry_station) { double :station, name: "Waterloo", zone: 1 }

    it { is_expected.to respond_to(:entry_point).with(1).argument }

    it "saves an entry station" do
      expect{ subject.entry_point(entry_station) }.to change{ subject.entry_station }.from(nil).to(entry_station)
    end
  end

  describe "#exit_point" do
    let (:exit_station) { double :station, name: "Waterloo", zone: 1 }

    it { is_expected.to respond_to(:exit_point).with(1).argument }

    it "saves an exit station" do
      expect { subject.exit_point(exit_station) }.to change { subject.exit_station }.from(nil).to(exit_station)
    end
  end

  describe "#complete?" do
    it "knows if a journey is not complete" do
      expect(subject).not_to be_complete
    end
  
    it "knows if a journey is complete" do
      subject.entry_point("test_entry")
      subject.exit_point("test_exit")
      expect(subject).to be_complete
    end
  end

  describe "#fare" do
    it "returns minimum fare when journey is complete" do
      subject.entry_point("test_entry")
      subject.exit_point("test_exit")
      expect(subject.fare).to eq 1
    end
  end
end