class Account
  STARTING_BALANCE = 0
  TODAYS_DATE = Time.now.strftime('%d/%m/%Y')

  attr_reader :balance

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @transactions = []
  end

  def deposit(money_in, date = TODAYS_DATE)
    @balance += money_in
    puts "Deposited: £#{money_in}. Updated balance: £#{@balance}."
    @transactions << "#{date} || #{'%.2f' % money_in} || #{@money_out}|| #{format('%.2f', 
@balance)}"
  end

  def withdrawal(money_out, date = TODAYS_DATE)
    fail 'Insufficient funds for withdrawal' if @balance < money_out
    @money_out = money_out
    @balance -= money_out
    puts "Withdrew: £#{money_out}. Updated balance: £#{@balance}."
    @transactions << "#{date} || || #{format('%.2f', @money_out)} || #{format('%.2f', @balance)}"
  end

  def show_balance
    return @balance
  end

end
