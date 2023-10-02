load 'user.rb'
load 'menu.rb'
load 'loan.rb'

#    Main:
#    A main class which is used to run the program.
#    Main has a menu and user.
class Main
    def initialize(user)
        @user = user
        @menu = Menu.new(@user)
    end

    def main

        while @menu.option != 3
            @menu.show_menu
            case @menu.option
            when 1
                @menu.new_loan
            when 2
                @menu.show_loans
            when 3
                puts "Exiting..."
            else
                puts "Invalid Option"
            end
        end
    end
end

#    Code to execute the program.
user = User.new
main = Main.new(user)
main.main