class Account
  attr_reader :balance

  def initialize(opening_balance = 0)
    @balance = opening_balance
    @account_history = []
  end

  def deposit(amount)
    @balance += amount
    @account_history << [get_time, amount, 0, @balance]
  end

  def withdraw(amount)
    @balance -= amount
    @account_history << [get_time, 0, amount, @balance]
  end

  def print_statement
    puts "date || credit || debit || balance"
    @account_history.reverse.each { |transaction|
      puts "#{transaction[0]} || #{transaction[1]} || #{transaction[2]} || #{transaction[3]}"
    }
  end

  private

  def get_time
    Time.now.strftime("%d-%m-%Y")
  end
end
