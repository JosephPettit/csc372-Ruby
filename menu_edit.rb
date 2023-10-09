# Class: MenuEdit
#
# Description:
#    Menu for editing budget
#
# frozen_string_literal: true

class MenuEdit < Menu

  def initialize(user)
    super "Edit Budget"
    @items = ["New Bill", "Delete Bill", "Delete All Bills"]
    @user = user
  end

  # Displays menu and handles user input
  def display_menu
    until @option == -1
      case super
      when 1 ##### New item #####
        new_bill_menu = MenuNew.new(@user)
        new_bill_menu.display_menu

      when 2 ##### Delete item #####
        edit_menu = Menu.new("Delete Bill")
        index = edit_menu.show_account_table(@user.accounts, selection: true)
        unless index == -1
          @user.accounts.delete_at(index - 1)
        end

      when 3 ##### Delete all items #####
        @user.accounts = []
        show_account_table(@user.accounts)
      end
    end
  end
end
