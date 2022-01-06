require_relative "oystercard"

class Journey
  attr_reader :journey_status, :entry_station, :exit_station
  def initialize
    @journey_status = nil
    @entry_station = nil
    @exit_station = nil
  end

  def start_journey
    @journey_status = "in journey"
  end

  def end_journey
    @journey_status = nil
    @entry_station = nil
    @exit_station = nil
  end

  def journey?
    @journey_status
  end

  def entry_point(entry_station)
    @entry_station = entry_station
  end

  def exit_point(exit_station)
    @exit_station = exit_station
  end

  def fare
    complete? ? Oystercard::MINIMUM_FARE : Oystercard::PENALTY_FARE
  end

  def complete?
    !!@entry_station && !!@exit_station
  end
end