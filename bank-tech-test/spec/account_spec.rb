require 'account'

describe Account do
  subject { described_class.new }
  
  before(:each) do
    allow(subject).to receive(:current_date).and_return('01/08/2019')
  end

  it '#balance' do
    expect(subject.balance).to eq(0)
  end

  it '#deposit' do
    subject.deposit(2000)
    expect(subject.balance).to eq(2000)
  end

  it '#withdraw' do
    subject.deposit(1000)
    subject.withdraw(500)
    expect(subject.balance).to eq(500)
  end

  it 'depositing 0 raises an error' do
    expect { subject.deposit(0) }.to raise_error(ArgumentError, 'Invalid amount')
  end

  it 'withdrawing -5 raises an error' do
    expect { subject.withdraw(-5) }.to raise_error(ArgumentError, 'Invalid amount')
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
