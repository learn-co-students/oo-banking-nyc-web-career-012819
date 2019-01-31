require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

def initialize(sender, receiver, status = "pending", amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = status
end

def valid?
  @sender.valid?
  @receiver.valid?
end

def execute_transaction
  if valid? && @sender.balance > @amount && @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = 'complete'
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end
end




end
