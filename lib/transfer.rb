class Transfer

  attr_accessor :status, :amount

  attr_reader :sender, :receiver

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && !@already_executed && @sender.balance > self.amount
      @receiver.deposit(@amount)
      @sender.deposit(-(@amount))
      self.status = "complete"
      @already_executed = true
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      #this transfer instance valid? false puts reject message and changes status

    # elsif !@sender.valid? && @sender.balance < @sender.amount
    #   self.status = "rejected"
    #   return "Transaction rejected. Please check your account balance."
     end
  end

  def reverse_transfer
    if @already_executed
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      self.status = "reversed"
  end
end












end
