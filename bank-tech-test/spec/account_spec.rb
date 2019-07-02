require 'account'

describe Account do
  subject { described_class.new }
  
  before(:each) do
    allow(subject).to receive(:get_time).and_return('01/07/2019')
  end

  it 'has a balance' do
    expect(subject.balance).to eq(0)
  end

  it 'deposits an amount with the current date' do
    subject.deposit(2000)
    expect(subject.balance).to eq(2000)
  end

  it 'withdraws an amount with the current date' do
    subject.deposit(1000)
    subject.withdraw(500)
    expect(subject.balance).to eq(500)
  end

  it 'prints a statement' do
    subject.deposit(1000)
    subject.deposit(2000)
    subject.withdraw(500)
    expect(subject.balance).to eq(2500)
    subject.print_statement
    expect { subject.print_statement }.to output("date || credit || debit || balance\n01/07/2019 ||  || 500 || 2500\n01/07/2019 || 2000 ||  || 3000\n01/07/2019 || 1000 ||  || 1000\n").to_stdout
  end
end
