#    Menu:
#    A menu class which is used to display the menu.
#    User input will be used to navigate the menu.
class Menu
    attr_accessor :option

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
        show_menu_item(4, "Amortization")
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

        loan.load_values 
        
        @user.loans.push(loan)
    end

    def show_loans

        if @user.loans.length == 0
            show_header("no loans")
            print "Any key to return to menu "
            gets
            return
        end

        show_header("loans")
        puts "| %-10s %12s %9s %7s %8s" % ["Loan type", "Principal", "Interest", "Months", "Payment"]
        @user.loans.each_with_index do |item, index| 
            line = "| %d. %-10s %9.2f %10.2f %6d $%.2f" % [index + 1, item.class, item.amount, item.interest, item.term, item.calc_monthly_payment]
            offset = @width - line.length
            right = "%#{offset -1}s" % [@v_char]
            puts line + right
        end 
        show_footer
        print "Any key to return to menu "
        gets
    end

    def show_amortization()
        calc = Calculator.new
        calc.calc_amortization_table(@user.loans.first)
    end 

    # Displays a menu header with centered text 
    def show_header(text)
        bar = @h_char * @width
        offset = (@width - text.length) / 2
        left = "%#{offset}s" % [@v_char]
        right = "%-#{offset}s" % [@v_char]
        puts "\n" + bar + "\n" + right + text.upcase + left + "\n" + bar
    end 

    # Displays menu item 
    def show_menu_item(index, text)
        right = "| %d. " % [index]
        offset = ((@width / 2) - text.length) + ((@width / 2) - right.length)
        left = "%#{offset}s" % [@v_char]
        puts right + text + left
    end 

    def show_footer
        puts @h_char * @width + "\n"
    end
end