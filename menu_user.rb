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
    when 1 # Show Budget
      puts @user.loans.inspect
      show_account_table(@user.loans)
    when 2
      loans = @user.loans.select { |item| item.is_a? Loan }
      show_loan_table(loans, selection: false)
    when 3
      edit_menu = MenuEdit.new(@user)
      edit_menu.display_menu
    end
  end
  end
end
