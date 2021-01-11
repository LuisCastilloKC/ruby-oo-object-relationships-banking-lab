class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.status == "pending"
      if self.sender.balance > self.amount && valid?  
        self.sender.balance -= amount
        self.receiver.deposit(amount)
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.deposit(amount)
      self.status = "reversed"
    end
  end
end



# Transfer
#   initialize
#     can initialize a Transfer
#     initializes with a sender
#     initializes with a receiver
#     always initializes with a status of 'pending'
#     initializes with a transfer amount
#   #valid?
#     can check that both accounts are valid
#     calls on the sender and receiver's #valid? methods
#   #execute_transaction
#     can execute a successful transaction between two accounts
#     each transfer can only happen once
#     rejects a transfer if the sender does not have enough funds (does not have a valid account)
#   #reverse_transfer
#     can reverse a transfer between two accounts
#     it can only reverse executed transfers

# Finished in 0.0198 seconds (files took 0.33474 seconds to load)
# 21 examples, 0 failures
