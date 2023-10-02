#   User:
#   A user class which is used to save user data. 
#   Allows for 5 loans at once per user per session.
class User
    def initialize
        @loans = []
    end

    def get_loans
        @loans
    end

    def add_loan(loan)
        @loans.push(loan)
    end

end

#    Loan:
#    A loan class which is used to save loan data.
#    User input will populate the data. Calculations
#    will be done in the Loan class. 
class Loan
    def initialize
        @amount = 0
        @interest = 0
        @term = 0
    end
    
    def get_amount
        @amount
    end

    def get_interest
        @interest
    end

    def get_term
        @term
    end

    def set_amount(amount)
        @amount = amount
    end

    def set_interest(interest)
        @interest = interest
    end

    def set_term(term)
        @term = term
    end

    # Annuity Formula and rounding to 2 decimal places
    def calc_monthly_payment
        @monthly_payment = (@amount * (@interest / 1200)) / (1 - (1 + (@interest / 1200)) ** -@term)
        @monthly_payment = @monthly_payment.round(2)
    end
end

#    Menu:
#    A menu class which is used to display the menu.
#    User input will be used to navigate the menu.
class Menu
    def initialize(user)
        @option = 0
        @user = user
    end

    def get_option
        @option
    end

    def show_menu
        puts "-------Menu-------"
        puts "| 1. New Loan    |"
        puts "| 2. Show Loans  |"
        puts "| 3. Exit        |" 
        puts "------------------"
        @option = gets.chomp.to_i
    end

    def new_loan
        loan = Loan.new
        puts "----New Loan----"
        print "Amount: "
        loan.set_amount(gets.chomp.to_f)
        print "Interest: "
        loan.set_interest(gets.chomp.to_f)
        print "Term (months): "
        loan.set_term(gets.chomp.to_i)

        puts "Loan Created"
        @user.add_loan(loan)

    end

    def show_loans

        if @user.get_loans.length == 0
            puts "No Loans"
            return
        end

        puts "----Show Loans----"
        i = 1
        @user.get_loans.each do |loan|
            puts ""
            
            puts "Amount: #{loan.get_amount}"
            puts "Interest: #{loan.get_interest}"
            puts "Term: #{loan.get_term}"
            puts "Monthly Payment: #{loan.calc_monthly_payment}"
            
        end
        puts ""
    end
end

#    Main:
#    A main class which is used to run the program.
#    Main has a menu and user.
class Main
    def initialize(user)
        @user = user
        @menu = Menu.new(@user)
    end

    def main
        while @menu.get_option != 3
            @menu.show_menu
            case @menu.get_option
            when 1
                @menu.new_loan
            when 2
                @menu.show_loans
            when 3
                puts "Exiting..."
            else
                puts "Invalid Option"
            end
        end
    end
end

#    Code to execute the program.
user = User.new
main = Main.new(user)
main.main