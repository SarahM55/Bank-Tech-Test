class Account
    DEFAULT_BALANCE = 0

    attr_reader :balance

    def initialize(balance = DEFAULT_BALANCE)
      @balance = balance
    #   @transactions = []
    end

    def deposit(amount)
      @balance += amount
    #   @transactions << @balance
    end

    def withdrawal(amount)
      @balance -= amount
    #   @transactions << @balance
    end

    # def view_transactions
    #   @transactions
    # end

end