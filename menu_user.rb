# frozen_string_literal: true

load "menu.rb"
class MenuUser < Menu
  def initialize(user)
    super "Personal Budget"
    @items = ["Show Budget", "Show Debt", "Edit Budget"]
    @user = user
  end

  def display_menu
    until @option == -1
    case super
    when 1 # Show budget
      puts @user.accounts.inspect
      show_account_table(@user.accounts)
    when 2 # Show debt
      loans = @user.accounts.select { |item| item.is_a? Loan }

			loans.each do |item|
				if item.is_a? CreditCard
					item.term = 0
				end
			end
      show_loan_table(loans, selection: false)
    when 3 # Edit budget
      edit_menu = MenuEdit.new(@user)
      edit_menu.display_menu
    end
  end
  end
end
