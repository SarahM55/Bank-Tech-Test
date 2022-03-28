class Account
    STARTING_BALANCE = 0

    attr_reader :balance

    def initialize(balance = STARTING_BALANCE)
      @balance = balance
    #   @transactions = []
    end

    def deposit(amount)
      @balance += amount
      puts "Deposited: £#{amount}. Updated balance: £#{@balance}."
    #   @transactions << @balance
    end

    def withdrawal(amount)
      fail 'Insufficient funds for withdrawal' if @balance < amount
      @balance -= amount
      puts "Withdrew: £#{amount}. Updated balance: £#{@balance}."
    #   @transactions << @balance
    end

    # def view_transactions
    #   @transactions
    # end

end