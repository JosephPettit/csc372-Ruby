load "loader.rb"
@user = User.new

main_menu = Menu.new("Main Menu")
main_menu.add_menu_item("Personal Budget")
main_menu.add_menu_item("Finance Calculator")
main_menu.add_menu_item("Load test user")

until main_menu.option == -1
  main_menu.display_menu(terminal: true)
  case main_menu.option
  when 1
    user_menu = MenuUser.new(@user)
    user_menu.display_menu
  when 2
		calc_menu = MenuCalc.new
		calc_menu.display_menu
  when 3
    load "t.rb"
    d = Dummy.new
    @user.accounts = d.accounts
		main_menu.show_header("Test user loaded")
  end
end

main_menu.show_header("GOODBYE")
