# Class: MenuNew
#
# Description:
#    Menu for adding new bills to budget
#
# frozen_string_literal: true

class MenuNew < Menu

  def initialize(user)
    super "Bills"
    @items = ["Utility Bill / Monthly reoccurring", "Credit Card", "Auto", "Personal"]
    @user = user
  end

  # Displays menu and handles user input
  def display_menu
    case super
    when 1
      bill = Bill.new
    when 2
      bill = CreditCard.new
    when 3
      bill = Auto.new
    when 4
      bill = Personal.new
    end

    if bill
      bill.load_values
      if bill.is_a?(Loan) && (!bill.is_a? CreditCard)
        bill.payment = Calculator.monthly_payment(bill)
      end
      @user.accounts.push(bill)

      puts "\nBill successfully added to budget"
    end
  end
end
