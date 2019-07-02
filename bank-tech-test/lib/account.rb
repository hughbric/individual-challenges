class Account
  attr_reader :balance

  def initialize(opening_balance = 0)
    @balance = opening_balance
    @account_history = []
  end

  def deposit(amount)
    @balance += amount
    @account_history << [date: get_time, credit: amount, debit: nil, balance: @balance]
  end

  def withdraw(amount)
    @balance -= amount
    @account_history << [date: get_time, credit: nil, debit: amount, balance: @balance]
  end

  def print_statement
    puts "date || credit || debit || balance"
    @account_history.reverse.each { |transaction|
      puts "#{transaction[0][:date]} || #{transaction[0][:credit]} || #{transaction[0][:debit]} || #{transaction[0][:balance]}"
    }
  end

  private

  def get_time
    Time.now.strftime("%d-%m-%Y")
  end
end
