# Class: Bill
#
# Description:
#   Class used for bill information for budgeting purposes

class Bill
  
  attr_accessor :name, :payment

  # Calls other functions to get Bill information
  def load_values
    load_name
    load_amount
  end

  # Gets name of bill
  def load_name
    print "Enter name of bill: "
    @name = gets.chomp
  end

  # Gets amount of bill
  def load_amount
    print "Amount: "
    @payment = gets.chomp.to_f
    while @payment < 1
      puts "\nInvalid loan amount entered\n"
      print "Amount: "
      @payment = gets.chomp.to_f
    end
  end
end