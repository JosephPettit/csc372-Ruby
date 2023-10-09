# Class: Calculator
#
# Description:
#   Class used to preform basic finance calculations, monthly 
#   payment and amortization break down

class Calculator

  # Calculates monthly payment for loan
  def self.monthly_payment(loan)
    (loan.amount * (loan.interest / 1200)) / (1 - (1 + (loan.interest / 1200))**-loan.term)
  end

  # Calculate and display amortization table for loan
  def self.amortization_table(loan, menu)
    show_table_header(menu)
    payment = loan.payment
    principal = loan.amount
    term = loan.term
    interest = loan.interest / 1200.0
    total_interest = 0
    month = 0

    term.times do
      start_principal = principal
      interest_payment = interest * principal
      principal_payment = payment - interest_payment
      principal -= principal_payment
      total_interest += interest_payment
      month += 1

      line = format("%2d $%-8.2f  $%-9.2f $%-9.2f $%-9.2f $%.2f", month, start_principal.round(2), principal_payment.round(2), interest_payment.round(2), payment.round(2), principal.round(2))
      menu.print_item(line)
    end

    menu.show_bar
    menu.print_item(format("Total Interest = $%.2f", total_interest))
    menu.print_item(format("Total Principal = $%.2f", loan.amount))
    menu.print_item(format("Total Payments = $%.2f", total_interest + loan.amount))
    menu.show_bar
    menu.validate_menu_selection(selection: false)
  end

  # Displays header for amortization table
  def self.show_table_header(menu)
    menu.show_header("Amortization Table")
    line = format(" %s  ( %s + %s = %s )  %s", "Starting", "Principal", "Interest", "Payment", "Balance")
    menu.print_item(line)
    menu.show_bar
  end
end