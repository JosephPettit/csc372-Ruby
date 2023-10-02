#    Menu:
#    A menu class which is used to display the menu.
#    User input will be used to navigate the menu.
class Menu
    attr_accessor :option, :user

    def initialize(user)
        @option = 0
        @user = user
        @width = 60;
        @h_char = "-"
        @v_char = "|"
    end

    def show_menu
        show_header("menu")
        show_menu_item(1, "New Loan")
        show_menu_item(2, "Show Loans")
        show_menu_item(3, "Exit")
        show_footer
        print "Enter selection: "
        @option = gets.chomp.to_i
    end

    def new_loan
        show_header("new loan")
        
        loan_type = -1
        invalid_entry = false

        # Until loop runs while the condition is false
        until loan_type > 0 and loan_type < 4 do
            if invalid_entry
                puts "\nInvalid entry, please try again\n"
            end 
            show_menu_item(1, "Auto")
            show_menu_item(2, "Mortgage")
            show_menu_item(3, "Personal")
            show_footer()

            print "Enter Type of loan: "
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
            if loan.is_a? Mortgage
                puts "Valid terms = 15, 30"
            elsif loan.is_a? Auto
                puts "12 <= Valid terms <= 73"
            end 
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

        @user.loans.each do |loan|
            puts "\nAmount: #{loan.amount}"
            puts "Interest: #{loan.interest}"
            puts "Term: #{loan.term}"
            puts "Monthly Payment: #{loan.calc_monthly_payment}"
            
        end
        puts ""
    end

    def show_header(text)
        bar = @h_char * @width
        offset = (@width - text.length) / 2
        left = "%#{offset}s" % [@v_char]
        right = "%-#{offset}s" % [@v_char]
        puts bar + "\n" + right + text.upcase + left + "\n" + bar
    end 

    def show_menu_item(index, text)
        right = "| %d. " % [index]
        offset = ((@width / 2) - text.length) + ((@width / 2) - right.length)
        left = "%#{offset}s" % [@v_char]
        puts right + text + left
    end 

    def show_footer
        puts @h_char * @width
    end
end