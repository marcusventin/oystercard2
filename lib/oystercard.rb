
class Oystercard
  attr_reader :balance, :entry_station, :journey_history
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + value) > MAXIMUM_BALANCE
    @balance += value
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journey_history << { entry_station: @entry_station, exit_station: station }
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

private

def deduct(fare)
  @balance -= fare
end

end