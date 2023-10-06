# frozen_string_literal: true

class MenuCalc < Menu
  def initialize
    super 'Finance Calculator'
    @items = ['Calculate Loan Monthly Payments', 'Amortization Calculator']
  end

  def display_menu(terminal: nil)
    until @option == -1
      case super
      when 1 ##### Monthly Payment #####
        loan = Loan.new
        loan.load_values
        loan.payment = Calculator.monthly_payment(loan)
        show_payment_results(loan)
        
      when 2 ##### Amortization Calc #####
        loan = Loan.new
        loan.load_values
        loan.payment = Calculator.monthly_payment(loan)
        amor_display = Menu.new("Amortization Table")
        Calculator.amortization_table(loan, amor_display)
      end
    end
  end

  def show_payment_results(loan)
    show_bar
    print_item(format("Loan Amount = $%.2f", loan.amount))
    print_item(format("Months of payment = %d",loan.term))
    print_item(format("Interest Rate = $%.2f", loan.interest))
    print_item(format(""))
    print_item(format("Monthly Payment = $%.2f", loan.payment))

    show_bar
    validate_menu_selection(selection:false)
  end
end
