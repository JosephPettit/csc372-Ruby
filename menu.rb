#    Menu:
#    A menu class which is used to display the menu.
#    User input will be used to navigate the menu.
class Menu
    attr_accessor :option

    def initialize(name)
        @option = -1
        @width = 60;
        @h_char = "-"
        @v_char = "|"
        @items = []
        @name = name
    end

    def display
        show_header(@name)
        @items.each_with_index do |item, index|
            show_menu_item(index + 1, item)
        end
        show_menu_item(-1, "exit");
        show_footer
        print "Enter selection: "
        @option = gets.chomp.to_i
        return option
    end 

    def add_menu_item(item)
        @items.push(item)
    end 

    def show_loan_table(loans, selection = false)

        if loans.length == 0
            show_header("no loans")
            print "Any key to return to menu "
            gets
            return
        end

        show_header("loans")
        puts "| %-10s %12s %9s %7s %8s" % ["Loan type", "Principal", "Interest", "Months", "Payment"]
        loans.each_with_index do |item, index| 
            line = "| %d. %-10s %9.2f %10.2f %6d $%.2f" % [index + 1, item.class, item.amount, item.interest, item.term, item.payment]
            offset = @width - line.length
            right = "%#{offset -1}s" % [@v_char]
            puts line + right
        end 
        show_footer
        if selection
            print "Enter line number to select loan"
            return (gets.chomp.to_i - 1)
        else 
            print "Any key to return to menu "
            gets
        end 
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