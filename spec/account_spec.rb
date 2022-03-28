require_relative '../lib/account.rb'

describe Account do
  let(:account) { Account.new }

  it 'should have an opening balance of 0' do
    expect(account.balance).to eq Account::DEFAULT_BALANCE
  end

#   describe '#transactions' do
#     it 'can make a transaction' do
#       account.deposit(1000)
#       expect(account.view_transactions.length).to be 1
#     end
#   end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'can make a deposit to increase the balance' do
      expect { account.deposit 1 }.to change{ account.balance }.by 1
    end

    it 'should have a balance of 500 after depositing 500' do
      account.deposit(500)
      expect(account.balance).to be 500
    end

    it 'should have a balance of 1500 after depositing 500 then 1000' do
      account.deposit(500)
      account.deposit(1000)
      expect(account.balance).to be 1500
    end
  end
  
  describe '#withdrawal' do
    it { is_expected.to respond_to(:withdrawal).with(1).argument }

    it 'can make a withdrawal to decrease the balance' do
      expect { account.withdrawal 1 }.to change{ account.balance }.by -1
    end

    it 'should have a balance of -100 if 100 is withdrawn from balance of 0' do
      account.withdrawal(100)
      expect(account.balance).to be -100
    end

    # it 'raises an error if user attempts to withdraw more than current balance' do
    #   minimum_balance = Account::DEFAULT_BALANCE
    #   expect{ account.withdrawal(amount) }.to raise_error "Insufficient funds for withdrawal - balance below #{balance}"
    # end
  end
end