#    Loan:
#    A loan class which is used to save loan data.
#    User input will populate the data. 
class Loan
    # Ruby way of avoiding getter and setter code
    attr_accessor :amount, :interest, :term, :payment

    def initialize
        @amount 
        @interest 
        @term 
        @payment
    end

    # Loads loan values 
    def load_values
        load_amount
        load_term
        load_interest_rate
    end 
    
    # loads and validats loan amount 
    def load_amount 
        print "Amount: "
        @amount = gets.chomp.to_f
        while @amount < 1 do 
            puts "\nInvalid loan amount entered\n"
            print "Amount: "
            @amount = gets.chomp.to_f
        end 
    end 

    # loads and validats loan term
    def load_term 
        print "Term: "
        @term = gets.chomp.to_i
        while @term.to_i < 1 do
            puts "\nInvalid loan term entered\n"
            print "Amount: "
            @term = gets.chomp.to_i
        end
    end 

    # loads and validats loan interest rate 
    def load_interest_rate 
        print "Interest rate: "
        @interest = gets.chomp.to_f
        while @interest < 1 do
            puts "\nInvalid loan interest rate entered\n"
            print "Amount: "
            @amount = gets.chomp.to_f
        end
    end 

    # Validates if term is an integer by default
    def validate_term
        return @term.is_a? Integer
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
        print "Loan term in years = 1\nLoan term in months = 2\n"
        selection = gets.chomp
        if (selection.to_i == 1)
            years = true
            print "Loan term in years: "
        end
    
        unless years
            print "Loan term in months: "
        end 

        if years 
            @term = @term.to_i * 12
        end
    end 

    # Not implemented yet, but may be used in the future
    def validate_term
        return ((@term == 15 or @term == 30) and @term.is_a? Integer)
    end
end 

class Auto < Loan
    # Not implemented yet, but may be used in the future
    def validate_term
        return (@term >= 12 and @term <= 72 and @term.is_a? Integer)
    end
end 

class Personal < Loan
    
end 