require_relative '../lib/account.rb'

describe Account do
  let(:account) { Account.new }

  it 'should have an opening balance of 0' do
    expect(account.balance).to eq Account::STARTING_BALANCE
  end

  it 'returns the users balance' do
    expect(account.get_balance).to be 0
  end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'can make a deposit to increase the balance' do
      expect { account.deposit 1 }.to change{ account.balance }.by 1
    end

    it 'should have a balance of 500 after depositing 500' do
      account.deposit(500, '29/03/2022')
      expect(account.balance).to be 500
    end

    it 'should have a balance of 1500 after depositing 500 then 1000' do
      account.deposit(500, '29/03/2022')
      account.deposit(1000, '29/03/2022')
      expect(account.balance).to be 1500
    end
  end
  
  describe '#withdrawal' do
    it { is_expected.to respond_to(:withdrawal).with(1).argument }

    it 'can make a withdrawal to decrease the balance' do
      account.deposit(1000, '29/03/2022')
      expect { account.withdrawal 1 }.to change{ account.balance }.by -1
    end

    it 'can make a withdrawl of 50, with previous deposit of 100, leaving balance of 50' do
      account.deposit(100, '01/01/2022')
      account.withdrawal(50, '02/01/2022')
      expect(account.balance).to be 50
    end

    it 'raises an error if user attempts to withdraw more than current balance' do
      account.deposit(1000, '29/03/2022')
      expect { account.withdrawal(1500, '29/03/2022') }.to raise_error 'Insufficient funds for withdrawal'
    end
  end
end