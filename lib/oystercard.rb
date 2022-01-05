
class Oystercard
  attr_reader :balance, :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + value) > MAXIMUM_BALANCE
    @balance += value
  end

 

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out

    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
   @entry_station != nil
  end

private

def deduct(fare)
  @balance -= fare
end

end