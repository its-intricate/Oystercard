class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
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

end
