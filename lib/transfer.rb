class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = "pending"
  end

  def valid?
  self.sender.valid? && self.receiver.valid? && self.sender.balance >= self.amount ? true : false
  end

  def execute_transaction
  	if self.status == "pending" && self.valid?
	  	self.sender.balance -= self.amount
	  	self.receiver.deposit(self.amount)
	  	self.status = "complete"
	  else
	  	self.status = "rejected"
	  	"Transaction rejected. Please check your account balance."
		end
  end

  def reverse_transfer
		if self.status == "complete"
	  	self.receiver.balance -= self.amount
	  	self.sender.deposit(self.amount)
	  	self.status = "reversed"
		end  
  end

end
