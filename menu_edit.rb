# frozen_string_literal: true

class MenuEdit < Menu
  def initialize(user)
    super "Edit Budget"
    @items = ["New Bill", "Delete Bill"]
    @user = user
  end

  def display_menu
    until @option == -1
      case super
      when 1 # New item
        new_bill_menu = MenuNew.new(@user)
        new_bill_menu.display_menu

      when 2 # Delete item
        edit_menu = Menu.new("Delete Bill")
        index = edit_menu.show_account_table(@user.accounts, selection: true)
        unless index == -1
          @user.accounts.delete_at(index - 1)
        end
      end
    end
  end
end
