require 'station'

describe Station do

  subject { described_class.new(name: "Waterloo", zone: 1) }

  describe "#initialize" do

    it "creates a station name" do
      expect(subject).to respond_to (:name)
    end

    it "creates station zone variable" do
      expect(subject).to respond_to (:zone)
    end

  end

end