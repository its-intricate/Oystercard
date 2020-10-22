require 'station', 'journey'

class Oystercard
  attr_reader :balance, :journeys
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
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


  def touch_in(station)
    fail "Balance is too low: #{@balance}" if @balance <= MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    journeys << journey.new(in, out)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
