require_relative '../lib/account.rb'

describe Account do
  let(:account) { Account.new }

  it 'should have an opening balance of 0' do
    expect(account.balance).to eq Account::DEFAULT_BALANCE
  end
end