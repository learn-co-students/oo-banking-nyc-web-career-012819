class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    elsif @balance = 0
      false
    end
  end

  def broke
    @status = 'closed'
  end

  def close_account
    broke
  end
end #end of Class
