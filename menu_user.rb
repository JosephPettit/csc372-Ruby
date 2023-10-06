# frozen_string_literal: true

class UserMenu < Menu
  def initialize(user)
    super "Personal Budget"
    @items = ["Show Budget", "Show Debt", "Edit Budget"]
    @user = user
  end

  def display_menu
    case super
    when 1
      # show budget
      puts @user.nil?
    when 2
    # show debt
    when 3
      bill_menu = BillMenu.new(@user)
      bill_menu.display_menu
    end
  end
end
