class Account
  attr_reader :name, :balance

  def initialize(name, balance=100)
    @name = name 
    @balance = balance
  end

  public

  def display_balance(pin_number)
    if pin_number.eql?(pin)
      puts "Balance: £#{@balance}." 
    else
      puts pin_error
    end
  end

  def withdraw(pin_number, amount)
    if pin_number.eql?(@pin)
      if overdrawn?(amount) == true
        puts "You cannot withdrawn £#{amount} from your account. Please add funds and try again later."
      else
        @balance -= amount
        puts "Withdrew #{amount}. New balance: #{@balance}"
      end
    else
      puts pin_error
    end
  end

  def deposit(pin_number, amount)
    if pin_number.eql?(pin) 
      @balance += amount
      puts "Deposited #{amount}. New Balance: #{@balance}"
    else
      puts pin_error
    end
  end

  def overdrawn?(amount)
    return true if (@balance - amount) < 0
    false
  end 
  
  private

  def pin
    @pin = 1234
  end

  def pin_error
    return "Access denied: incorrect PIN."
  end
end

class SavingsAccount < Account
end

class CheckingAccount < Account
end

checking_account = Account.new('Mortgage', 35)
checking_account.display_balance(1234)
checking_account.deposit(1234, 35)
checking_account.display_balance(1234)
checking_account.withdraw(1234, 71)
checking_account.withdraw(1232, 30)
my_savings = SavingsAccount.new('Rainy day fund', 200)
my_savings.display_balance(1234)
