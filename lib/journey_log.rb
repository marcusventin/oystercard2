require_relative "journey"

class JourneyLog

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @current_journey = @journey_class.new(entry_station: station)
    @journeys << { entry_station: @current_journey.entry_station }
  end

  def finish(station)
    @journeys.delete(entry_station: @current_journey.entry_station)
    @current_journey.end_journey(exit_station: station)
    @journeys << { entry_station: @current_journey.entry_station, exit_station: @current_journey.exit_station }
  end

  def journeys
    @journeys.dup
  end

  def in_transit?
    @current_journey.journey?
  end

  def fare
    @current_journey.fare
  end

  def reset
    @current_journey = nil
  end

private

  def current_journey
    @current_journey ||= journey_class.new
  end

end