class Transfer

attr_accessor :sender, :receiver, :status, :amount

  def initialize(reciever, sender, amount)
    @sender = sender
    @receiver = receiver
    @amount = 50
    @status = "pending"
  end

  def valid?
    if sender.valid? && sender.balance > @amount && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    binding.pry
  end

end #end of Class
