require 'account'

describe Account do
  subject { described_class.new }
  
  before(:each) do
    allow(subject).to receive(:current_date).and_return('01/08/2019')
  end

  it 'has a balance' do
    expect(subject.balance).to eq(0)
  end

  it 'deposits an amount' do
    subject.deposit(2000)
    expect(subject.balance).to eq(2000)
  end

  it 'withdraws an amount' do
    subject.deposit(1000)
    subject.withdraw(500)
    expect(subject.balance).to eq(500)
  end

  it 'prints a statement with dates' do
    subject.deposit(1000)
    subject.deposit(2000)
    subject.withdraw(500)
    expectation = "date || credit || debit || balance\n"\
                  "01/08/2019 ||  || 500 || 2500\n"\
                  "01/08/2019 || 2000 ||  || 3000\n"\
                  "01/08/2019 || 1000 ||  || 1000\n"
    expect(subject.balance).to eq(2500)
    expect { subject.print_statement }.to output(expectation).to_stdout
  end
end
