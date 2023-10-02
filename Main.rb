load 'user.rb'
load 'menu.rb'
load 'loan.rb'
load 'calculator.rb'

user = User.new
calc = Calculator.new 

main_menu = Menu.new("WELCOME")
main_menu.add_menu_item("New Loan")
main_menu.add_menu_item("Show Loans")
main_menu.add_menu_item("Amortization")

while main_menu.display != -1
    case main_menu.option 
    when 1 
        loan_menu = Menu.new("loans")
        loan_menu.add_menu_item("Auto")
        loan_menu.add_menu_item("Mortgage")
        loan_menu.add_menu_item("Personal")
        
        case loan_menu.display
        when 1 
            loan = Auto.new
        when 2 
            loan = Mortgage.new
        when 3
            loan = Personal.new
        end 
        
        if loan_menu.option != -1 
            loan.load_values
            loan.payment = calc.monthly_payment(loan)
            user.loans.push(loan)
        end

    when 2 
        main_menu.show_loan_table(user.loans)
    when 3 
        selection = main_menu.show_loan_table(user.loans, selection = true)
        calc.amortization_table(user.loans[selection])
    end 
end 
        
