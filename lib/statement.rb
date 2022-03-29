require_relative '../lib/account'

class Statement

  def initialize(account)
    @account = account
    @header = 'date || credit || debit || balance'
  end

  def print_statement
    "#{@header}\n" + @account.transactions.reverse.join
  end

end
