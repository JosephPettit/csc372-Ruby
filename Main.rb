load "loader.rb"
@user = User.new

main_menu = Menu.new("Main Menu")
main_menu.add_menu_item("Personal Budget")
main_menu.add_menu_item("Finance Calculator")
main_menu.add_menu_item("Load test user")

until main_menu.option == -1
  main_menu.display_menu(terminal: true)
  case main_menu.option
  when 1 ##### User Menu #####
    user_menu = MenuUser.new(@user)
    user_menu.display_menu

  when 2 ##### Finance Calc Menu #####
    calc_menu = MenuCalc.new
    calc_menu.display_menu

  when 3 ##### Load Dummy User #####
    load "dummy_user.rb"
    d = Dummy.new
    @user.accounts = d.accounts
    main_menu.show_header("Test user loaded")
    main_menu.validate_menu_selection(selection:false)
  end
end

main_menu.show_header("GOODBYE")