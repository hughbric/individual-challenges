# This bank account keeps track of transactions
class Account
  attr_reader :balance

  def initialize(opening_balance = 0)
    @balance = opening_balance
    @account_history = []
  end

  def deposit(amount)
    raise ArgumentError, 'Invalid amount' if amount <= 0

    @balance += amount
    record_transaction(credit: amount)
  end

  def withdraw(amount)
    raise ArgumentError, 'Invalid amount' if amount <= 0
    
    @balance -= amount
    record_transaction(debit: amount)
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

  def record_transaction(credit: nil, debit: nil)
    @account_history << {
      balance: @balance,
      credit: credit,
      date: current_date,
      debit: debit
    }
  end
end
