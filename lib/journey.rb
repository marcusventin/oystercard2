require_relative "oystercard"

class Journey
  attr_reader :journey_status, :entry_station, :exit_station
  def initialize(entry_station: )
    @journey_status = "in journey"
    @entry_station = entry_station
    @exit_station = nil
  end

  def end_journey(exit_station: )
    @exit_station = exit_station
    @journey_status = nil
  end

  def journey?
    @journey_status
  end

  def fare
    complete? ? Oystercard::MINIMUM_FARE : Oystercard::PENALTY_FARE
  end

  def complete?
    !!@entry_station && !!@exit_station
  end
end