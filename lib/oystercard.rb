require_relative "journey"
require_relative "journey_log"

class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(value)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + value) > MAXIMUM_BALANCE
    @balance += value
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.fare)
   # @journey_log.reset
  end

  def in_journey?
    @journey_log.in_transit?
  end

  def journey_history
    @journey_log.journeys
  end


private

  def deduct(price)
    @balance -= price
  end

end