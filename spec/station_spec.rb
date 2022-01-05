require 'station'

describe Station do

  subject { described_class.new("Waterloo", 1) }

  describe "#initialize" do

    it "creates station name variable" do
      expect(subject).to respond_to (:name)
    end

    it "creates station zone variable" do
      expect(subject).to respond_to (:zone)
    end

  end

end