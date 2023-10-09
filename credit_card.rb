# Class: CreditCard
#
# Description:
#   Loan subclass with information specific to credit cards

load "loan.rb"

class CreditCard < Loan
  
  attr_accessor :name

  # Calls all functions to get credit card information
  def load_values
    load_name
    load_payment
    load_amount
    load_interest_rate
  end

  # Gets name of credit card
  def load_name
    print "Enter name of credit card: "
    @name = gets.chomp
  end

  # Gets monthly payment for credit card
  def load_payment
    print "Enter monthly payment: "
    @payment = gets.chomp.to_f
    while @payment < 1
      puts "\nInvalid loan amount entered\n"
      print "Payment: "
      @payment = gets.chomp.to_f
    end
  end

  # Gets balance of credit card
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