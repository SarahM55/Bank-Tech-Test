require_relative '../lib/account'
require_relative '../lib/statement'

describe Statement do
  let(:account) { instance_double('account', header: 'date || credit || debit || balance', transactions: []) }

  context 'it allows a customer to print a statement' do

    it 'prints statement in a formated string: "date || credit || debit || balance"' do
      statement = Statement.new(account)
      expect(statement.print_statement).to include 'date || credit || debit || balance'
    end
  end
end
