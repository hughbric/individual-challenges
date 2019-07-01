require 'account'

describe Account do
  it 'has a balance' do
    account = Account.new(2000)
    expect(account.balance).to eq(2000)
  end
end
