class Account
    DEFAULT_BALANCE = 0

    attr_reader :balance

    def initialize(balance = DEFAULT_BALANCE)
      @balance = balance
      @account = []
    end

    def deposit(amount)
      @account << @balance += amount
    end

end