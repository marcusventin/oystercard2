require_relative "journey"

class Oystercard
  attr_reader :balance, :journey_history
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journey_history = []
    @journey = Journey.new
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + value) > MAXIMUM_BALANCE
    @balance += value
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    @journey.entry_point(station)
    @journey.start_journey
  end

  def touch_out(station)
    @journey.exit_point(station)
    deduct(@journey.fare)
    @journey_history << { entry_station: @journey.entry_station, exit_station: @journey.exit_station }
    @journey.end_journey
  end

  def in_journey?
    !!@journey.journey?
  end

private

  def deduct(price)
    @balance -= price
  end

end