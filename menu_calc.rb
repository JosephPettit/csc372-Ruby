# frozen_string_literal: true

class MenuCalc < Menu

  def initialize()
    super "Finance Calculator"
  @items = ["Calculate Loan Monthly Payments", "Amortization Calculator"]
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

      end
    end
  end

  def show_payment_results(loan)
    puts
  show_bar
  # show_bar
  print_item(format("Principal = $%.2f", loan.amount))
  print_item(format("Months = %d",loan.term))
  print_item(format("Interest Rate = %.2f%%",loan.interest))
  print_item(format("Monthly Payment = $%.2f", loan.payment))
  show_bar
  end

  def print_item(item)
    left = ("#{@v_char} #{item}")
  right = "#{@v_char}"
  center = @width - (left.length + right.length)
  puts left + (" " * center).to_s + right
  end
end
