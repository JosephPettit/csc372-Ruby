load "loader.rb"
@user = User.new

main_menu = Menu.new("Main Menu")
main_menu.add_menu_item("Personal Budget")
main_menu.add_menu_item("Finance Calculator")

until main_menu.option == -1
  main_menu.display_menu
  case main_menu.option
  when 1
    user_menu = MenuUser.new(@user)
    user_menu.display_menu
  when 2
    puts "Finance Menu here "
  end
end
main_menu.show_header("GOODBYE")

