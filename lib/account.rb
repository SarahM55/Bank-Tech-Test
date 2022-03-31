require_relative './statement'

class Account
  STARTING_BALANCE = 0
  STATEMENT_HEADER = "date || credit || debit || balance\n".freeze
  TODAYS_DATE = Time.now.strftime('%d/%m/%Y')

  attr_reader :balance

  def initialize(balance = STARTING_BALANCE, statement_class: Statement)
    @balance = balance
    @transactions = []
    @statement = statement_class.new
  end

  def deposit(money_in, date = TODAYS_DATE)
    @balance += money_in
    puts STATEMENT_HEADER
    puts @transactions << "#{date} || #{money_in} || #{@money_out}|| #{@balance}"
  end

  def withdrawal(money_out, date = TODAYS_DATE)
    fail 'Insufficient funds for withdrawal' if @balance < money_out
    @money_out = money_out
    @balance -= money_out
    puts STATEMENT_HEADER
    puts @transactions << "#{date} || || #{@money_out} || #{@balance}"
  end

  def generate_statement
    @statement.print STATEMENT_HEADER
    statement_rows = @transactions.map(&:display)
    @statement.print statement_rows
  end
end
