# Class: Loan
#
# Description:
#    A loan class which is used to save loan data.
#    User input will populate the data.

class Loan
  
  attr_accessor :amount, :term, :interest, :payment, :name

  # Loads loan values
  def load_values
    load_amount
    load_term
    load_interest_rate
    if @name.nil?
      @name = self.class.to_s + " loan"
    end
  end

  # loads and validates loan term
  def load_term
    print "Enter loan term in months: "
    @term = gets.chomp.to_i
    while @term.to_i < 1
      puts "\nInvalid loan term entered\n"
      print "Amount: "
      @term = gets.chomp.to_i
    end
  end

  # loads and validates loan amount
  def load_amount
    print "Enter amount of loan: "
    @amount = gets.chomp.to_f
    while @amount < 1
      puts "\nInvalid loan amount entered\n"
      print "Amount: "
      @amount = gets.chomp.to_f
    end
  end

  # loads and validates loan interest rate
  def load_interest_rate
    print "Enter interest rate (12.4% -> 12.4): "
    @interest = gets.chomp.to_f
    while @interest < 1
      puts "\nInvalid loan interest rate entered\n"
      print "Amount: "
      @amount = gets.chomp.to_f
    end
  end
end


class Auto < Loan
end

class Personal < Loan
end
