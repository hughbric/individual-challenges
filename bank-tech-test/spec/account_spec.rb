require 'account'

describe Account do
  subject { described_class.new(2000) }

  it 'has a balance' do
    expect(subject.balance).to eq(2000)
  end

  it 'can be depositted' do
    expect(subject.deposit(500)).to eq(2500)
  end
end
