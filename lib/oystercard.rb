require 'station'
require 'journey'

class Oystercard
  attr_accessor :balance, :journeys, :journey
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Exceeds balance limit of #{MAX_BALANCE}" if exceed_balance?(amount)
    @balance += amount
  end

  def exceed_balance?(amount)
    new_balance = @balance + amount
    new_balance > MAX_BALANCE
  end


  def touch_in(name, zone)
    fail "Balance is too low: #{@balance}" if @balance <= Journey::MIN_FARE
    @journey = Journey.new
    @journey.entry_station = Station.new(name, zone)
  end

  def touch_out(name, zone)
    @journey.exit_station = Station.new(name, zone)
    deduct(@journey.fare)
    @journey.finish(name)
    update_journey = {in: @journey.entry_station , out: @journey.exit_station }
    journeys << update_journey
    @journey.entry_station = nil
  end

  def in_journey?
    true unless @journey.nil? || @journey.exit_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
