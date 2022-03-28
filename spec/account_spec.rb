require_relative '../lib/account.rb'

describe Account do
  let(:account) { Account.new }

  it 'should have an opening balance of 0' do
    expect(account.balance).to eq Account::DEFAULT_BALANCE
  end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'can make a deposit to increase the balance' do
      expect { account.deposit 1 }.to change{ account.balance }.by 1
    end
  end
end