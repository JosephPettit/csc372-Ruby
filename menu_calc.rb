# frozen_string_literal: true

class MenuCalc < Menu
  def initialize
    super 'Finance Calculator'
    @items = ['Calculate Loan Monthly Payments', 'Amortization Calculator']
  end

  def display_menu(terminal: nil)
    until @option == -1

      case super
      when 1 # Monthly Payment
        loan = Loan.new
        loan.load_values
        loan.payment = Calculator.monthly_payment(loan)
        show_payment_results(loan)
      when 2 # Amortization Calc
        loan = Loan.new
        loan.load_values
        loan.payment = Calculator.monthly_payment(loan)
        amor_display = Menu.new("Amortization Table")
        Calculator.amortization_table(loan, amor_display)
      end
    end
  end
end
