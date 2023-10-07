load "loan.rb"

class CreditCard < Loan
  attr_accessor :name

  def load_values
    load_name
    load_payment
    load_amount
    load_interest_rate
  end

  def load_name
    print "Enter name of credit card: "
    @name = gets.chomp
  end

  def load_payment
    print "Enter monthly payment: "
    @payment = gets.chomp.to_f
    while @payment < 1
      puts "\nInvalid loan amount entered\n"
      print "Payment: "
      @payment = gets.chomp.to_f
    end
  end

  def load_amount
    print "Enter account balance: "
    @amount = gets.chomp.to_f
    while @amount < 1
      puts "\nInvalid loan amount entered\n"
      print "Amount: "
      @amount = gets.chomp.to_f
    end
  end
end
