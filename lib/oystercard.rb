class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90


  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Exceeds balance limit of #{MAX_BALANCE}" if exceed_balance?(amount)
    @balance += amount
  end

  def exceed_balance?(amount)
    new_balance = @balance + amount
    new_balance > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
