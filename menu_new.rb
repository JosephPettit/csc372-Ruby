# frozen_string_literal: true

class MenuNew < Menu
  def initialize(user)
    super "Bills"
    @items = ["Utility Bill / Monthly reoccurring", "Credit Card", "Auto", "Personal", "Mortgage"]
    @user = user
  end

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
    when 5
      bill = Mortgage.new
    end

    if bill
      bill.load_values
      if bill.is_a? Loan and not bill.is_a? CreditCard
				bill.payment = Calculator.monthly_payment(bill)
        @user.loans.push(bill)
			else
				@user.loans.push(bill)
      end
      puts "\nBill successfully added to budget\n#{bill.inspect}"
    end
  end
end
