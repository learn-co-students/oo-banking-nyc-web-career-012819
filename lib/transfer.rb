class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if @sender && @receiver
      true
    else
      false
    end
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && @sender.balance > @amount
      if @status == "pending"
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    end
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
  end
  end

end
