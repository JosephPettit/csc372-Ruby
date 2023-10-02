#    Loan:
#    A loan class which is used to save loan data.
#    User input will populate the data. Calculations
#    will be done in the Loan class. 
class Loan
    # Ruby way of avoiding getter and setter code
    attr_accessor :amount, :interest, :term

    def initialize
        @amount 
        @interest 
        @term 
    end

    # Annuity Formula and rounding to 2 decimal places
    def calc_monthly_payment
        @monthly_payment = (@amount * (@interest / 1200)) / (1 - (1 + (@interest / 1200)) ** -@term)
        @monthly_payment = @monthly_payment.round(2)
    end

    # Validates if term is an integer by default
    def validate_term
        return @term.is_a? Integer
    end 
end

# Mortgage, Auto and Personal are children of Loan 

class Mortgage < Loan
    def validate_term
        return ((@term == 15 or @term == 30) and @term.is_a? Integer)
    end
end 

class Auto < Loan 
    def validate_term
        return (@term >= 12 and @term <= 72 and @term.is_a? Integer)
    end
end 

class Personal < Loan 
    
end 