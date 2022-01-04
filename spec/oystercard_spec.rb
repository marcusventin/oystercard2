require "oystercard"

describe Oystercard do
  describe "#initialize" do
    it "has a default balance of 0" do
      expect(subject.balance).to eq 0
    end
  end
  
  # it {expect(subject).to respond_to(:balance) }
  
end