# This bank account keeps track of transations
class Account
  attr_reader :balance

  def initialize(opening_balance = 0)
    @balance = opening_balance
    @account_history = []
  end

  def deposit(amount)
    @balance += amount
    @account_history << {
      balance: @balance,
      credit: amount,
      date: current_date,
      debit: nil
    }
  end

  def withdraw(amount)
    @balance -= amount
    @account_history << {
      balance: @balance,
      credit: nil,
      date: current_date,
      debit: amount
    }
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @account_history.reverse.each do |transaction|
      puts "#{transaction[:date]} || "\
           "#{transaction[:credit]} || "\
           "#{transaction[:debit]} || "\
           "#{transaction[:balance]}"
    end
  end

  private

  def current_date
    Time.now.strftime('%d-%m-%Y')
  end
end
