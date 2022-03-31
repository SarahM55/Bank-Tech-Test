require_relative '../lib/account'
require_relative '../lib/statement'

describe Statement do
  before(:each) do
    @account = Account.new
  end

  it 'prints statement in the correct format' do
    expect { subject.print('date || credit || debit || balance') }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'should include the value of a deposit, type of transaction, and resulting balance' do
    @account.deposit(50)
    expect { @account.generate_statement }.to output("date || credit || debit || balance\n31/03/2022 || 50 || || 50\n").to_stdout
  end
end
