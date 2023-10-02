# frozen_string_literal: true

load 'user.rb'
load 'menu.rb'
load 'loan.rb'
load 'calculator.rb'

user = User.new
calc = Calculator.new

main_menu = Menu.new('WELCOME')
main_menu.add_menu_item('New Loan')
main_menu.add_menu_item('Show Loans')
main_menu.add_menu_item('Amortization')


loop do
case main_menu.display
 when 1
    loan_menu = Menu.new('loans')
    loan_menu.add_menu_item('Auto')
    loan_menu.add_menu_item('Mortgage')
    loan_menu.add_menu_item('Personal')

    case loan_menu.display
    when 1
      loan = Auto.new
    when 2
      loan = Mortgage.new
		when 3
		 loan = Personal.new
    else
		 loan = nil
		end

		if loan
    	loan.load_values
    	loan.payment = calc.monthly_payment(loan)
    	user.loans.push(loan)
		end

 when 2
    main_menu.show_loan_table(user.loans)
 when 3
    selection = main_menu.show_loan_table(user.loans, selection: true)
		calc.amortization_table(user.loans[selection - 1]) if selection != -1
 else
	main_menu.show_header("GOODBYE")
	break
 end
end
