
class Oystercard
  attr_reader :balance
  MAXIMUM_VALUE = 90
  def initialize
    @balance = 0
    @journey_status = false
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_VALUE} exceeded" if (@balance + value) > MAXIMUM_VALUE
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @journey_status = true
  end

  def touch_out
    @journey_status = false
  end

  def in_journey?
   @journey_status
  end
end