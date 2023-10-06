# frozen_string_literal: true

class BillMenu < Menu
  def initialize(user)
    super "Edit Budget"
    @items = ["New Bill", "Delete Bill"]
    @user = user
  end

  def display_menu
		until @option == -1
    case super
    when 1 # New Bill
      bill_menu = Menu.new("bills")
      bill_menu.add_menu_item("Utility Bill / Monthly reoccurring")
      bill_menu.add_menu_item("Credit Card")
      bill_menu.add_menu_item("Auto")
      bill_menu.add_menu_item("Personal")
      bill_menu.add_menu_item("Mortgage")

      bill = nil
      case bill_menu.display_menu
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
        puts @user.loans
        @user.loans.push(bill)
				puts "\n\nBill succesfully added to budget"
      end

    when 2 # Edit Budget
      bill_menu = Menu.new("Delete Bill")
      # get index of bill
      index = bill_menu.show_loan_table(@user.loans, selection: true)
      @user.loans.delete_at(index)
    end
		end
		end
end
