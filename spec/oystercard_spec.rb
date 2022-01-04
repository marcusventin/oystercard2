require "oystercard"

describe Oystercard do
  describe "#initialize" do
    it "has a default balance of 0" do
      expect(subject.balance).to eq 0
    end
  end
  
  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }
  
    it "adds a value to the balance" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
  end
    # it {expect(subject).to respond_to(:balance) }
  
end