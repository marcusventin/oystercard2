require "oystercard"

describe Oystercard do
  maximum_balance = Oystercard::MAXIMUM_BALANCE

  describe "#initialize" do
    it "has a default balance of 0" do
      expect(subject.balance).to eq 0
    end
  end
  
  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }
  
    it "adds a value to the balance" do
      expect{ subject.top_up 10}.to change{ subject.balance }.by 10
    end

    it "raises error if balance exceeds maximum value" do

      subject.top_up(maximum_balance)
      expect{ subject.top_up(1) }.to raise_error("Maximum balance of #{maximum_balance} exceeded")
    end
  end

  describe "#touch_in" do
      it { is_expected.to respond_to(:touch_in) }

      it "changes journey status to true" do
        subject.top_up(maximum_balance)
        subject.touch_in
        expect(subject).to be_in_journey
      end

    it "raises error if balance is insufficient" do
      expect{ subject.touch_in }.to raise_error "Insufficient balance"
    end

  end

  describe "#touch_out" do
    before { subject.top_up(maximum_balance) 
    subject.touch_in}

      it "changes journey status to false" do
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

      it "deducts balance by minimum fare" do
        expect{ subject.touch_out}.to change { subject.balance }.by (-Oystercard::MINIMUM_FARE)
      end
  end

  describe "#in_journey?" do
    it { is_expected.to respond_to(:in_journey?) }

    it "returns true when touched in" do
      subject.top_up(maximum_balance)
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end

    it "returns false when not in journey" do
      expect(subject.in_journey?).to eq false
    end
  end
    # it {expect(subject).to respond_to(:balance) }
  
end