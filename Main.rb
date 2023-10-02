# frozen_string_literal: true

load "user.rb"
load "menu.rb"
load "loan.rb"
load "calculator.rb"

user = User.new
calc = Calculator.new

main_menu = Menu.new("WELCOME")
main_menu.add_menu_item("New Loan")
main_menu.add_menu_item("Show Loans")
main_menu.add_menu_item("Amortization")

loan_menu = Menu.new("loans")
loan_menu.add_menu_item("Auto")
loan_menu.add_menu_item("Mortgage")
loan_menu.add_menu_item("Personal")

loop do
  case main_menu.display_menu
  when 1
    # noinspection RubyCaseWithoutElseBlockInspection
		loan = case loan_menu.display_menu
		when 1
			Auto.new
		when 2
			Mortgage.new
		when 3
			Personal.new
		end

    if loan
      loan.load_values
      loan.payment = calc.monthly_payment(loan)
      user.loans.push(loan)
    end

  when 2
    main_menu.show_loan_table(user.loans)
  when 3
     selection = main_menu.show_loan_table(user.loans, selection: user.loans.length)
    
     if selection.to_i != -1
     calc.amortization_table(user.loans[selection.to_i - 1])
     end
  else
   main_menu.show_header("GOODBYE")
   break
  end
end
