require 'station'
require 'oystercard'

class Journey
  attr_accessor :entry_station, :exit_station
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def finish(name)
    @exit_station.name = name
  end

  def fare
    if @entry_station && @exit_station then return MIN_FARE end
    PENALTY_FARE
  end

  def complete
    !!finish
  end

end
