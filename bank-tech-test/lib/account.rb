class Account
  attr_reader :balance

  def initialize(opening_balance)
    @balance = opening_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
