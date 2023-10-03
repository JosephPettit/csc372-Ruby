#    Loan:
#    A loan class which is used to save loan data.
#    User input will populate the data.
class Loan
  # Ruby way of avoiding getter and setter code
  attr_accessor :amount, :interest, :term, :payment

  # Loads loan values
  def load_values
    load_amount
    load_term
    load_interest_rate
  end

  # loads and validates loan amount
  def load_amount
    print "Amount: "
    @amount = gets.chomp.to_f
    while @amount < 1
      puts "\nInvalid loan amount entered\n"
      print "Amount: "
      @amount = gets.chomp.to_f
    end
  end

  # loads and validates loan term
  def load_term
    print "Term: "
    @term = gets.chomp.to_i
    while @term.to_i < 1
      puts "\nInvalid loan term entered\n"
      print "Amount: "
      @term = gets.chomp.to_i
    end
  end

  # loads and validates loan interest rate
  def load_interest_rate
    print "Interest rate: "
    @interest = gets.chomp.to_f
    while @interest < 1
      puts "\nInvalid loan interest rate entered\n"
      print "Amount: "
      @amount = gets.chomp.to_f
    end
  end

  # Validates if term is an integer by default
  def validate_term
    @term.is_a? Integer
  end
end

# Mortgage, Auto and Personal are children of Loan
class Mortgage < Loan
  attr_accessor :years

  def initialize
    # May be used in the future to display amortization table in years
    @years = false
  end

  def load_term
    print "Loan term in years : "
    @term = gets.chomp
    while @term.to_i < 1
      puts "\nInvalid loan term entered\n"
      print "Amount: "
      @term = gets.chomp.to_i
    end

    @term = @term.to_i * 12 
  end

  # Not implemented yet, but may be used in the future
  def validate_term
    ((@term == 15 or @term == 30) and @term.is_a? Integer)
  end
end

class Auto < Loan
  # Not implemented yet, but may be used in the future
  def validate_term
    (@term >= 12 and @term <= 72 and @term.is_a? Integer)
  end
end

class Personal < Loan
end
