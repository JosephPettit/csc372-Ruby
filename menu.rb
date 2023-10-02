#    Menu:
#    A menu class which is used to display the menu.
#    User input will be used to navigate the menu.
class Menu
    attr_accessor :option, :user
    def initialize(user)
        @option = 0
        @user = user
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
        # loan = Loan.new
        puts "----New Loan----"
        
        loan_type = -1
        invalid_entry = false

        # Until loop runs while the condition is false
        until loan_type > 0 and loan_type < 4 do
            if invalid_entry
                puts "\nInvalid entry, please try again\n"
            end 
            puts "Enter Type of loan: "
            puts "1 = Auto"
            puts "2 = Mortgage" 
            puts "3 = Personal"
            loan_type = gets.chomp.to_i
            invalid_entry = (loan_type < 1 or loan_type > 3)
        end 

        # Instead of 'switch' statements Ruby has 'case' statements 
        case loan_type.to_i
        when 1
            loan = Auto.new
        when 2 
            loan = Mortgage.new
        else 
            loan = Personal.new
        end 

        print "Amount: "
        loan.amount = gets.chomp.to_f
        while loan.amount < 1 do 
            puts "\nInvalid loan amount entered\n"
            print "Amount: "
            loan.amount = gets.chomp.to_f
        end 

        print "Loan terms in months: "
        loan.term = gets.chomp.to_i
        until loan.validate_term() do 
            puts "\nInvalid term entered for #{loan.class} loan\n"
            print "Loan terms in months: "
            loan.term = gets.chomp.to_i
        end

        print "Interest rate: "
        loan.interest = gets.chomp.to_f
        while loan.interest < 1 do
            uts "\nInvalid loan interest rate entered\n"
            print "Amount: "
            loan.amount = gets.chomp.to_f
        end

        @user.loans.push(loan)
    end

    def show_loans

        if @user.loans.length == 0
            puts "No Loans"
            return
        end

        puts "----Show Loans----"
        i = 1
        @user.loans.each do |loan|
            puts "\nAmount: #{loan.amount}"
            puts "Interest: #{loan.interest}"
            puts "Term: #{loan.term}"
            puts "Monthly Payment: #{loan.calc_monthly_payment}"
            
        end
        puts ""
    end
end