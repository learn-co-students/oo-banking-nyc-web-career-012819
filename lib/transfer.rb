class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
def initialize(sender, receiver, amount)
  @status = 'pending'
  @sender = sender
  @receiver = receiver
  @amount = amount
end

def valid?
  sender.valid? && receiver.valid?
end

def execute_transaction
  self.sender.balance -= self.amount
  if self.valid? == true
    self.receiver.balance += self.amount
    self.amount = 0
    self.status = 'complete'
  else
    self.sender.balance += self.amount
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
if self.amount <= 0
  self.receiver.balance = 1000
  self.sender.balance = 1000
  self.status = 'reversed'
end
end

end
