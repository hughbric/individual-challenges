require 'account'

describe Account do
  subject { described_class.new(1000) }

  it 'has a balance' do
    expect(subject.balance).to eq(1000)
  end

  it 'can be depositted' do
    expect(subject.deposit(2000)).to eq(3000)
  end

  it 'can be withdrawn' do
    expect(subject.withdraw(500)).to eq(500)
  end
end
