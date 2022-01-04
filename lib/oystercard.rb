
class Oystercard
  attr_reader :balance
  MAXIMUM_VALUE = 90
  def initialize#(balance = 0)
    @balance = 0
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_VALUE} exceeded" if (@balance + value) > MAXIMUM_VALUE
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end
end