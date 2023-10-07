# Class: Menu
#
# Description:
#    Menu class for displaying menus and getting user input
#    from the terminal

class Menu

  attr_accessor :option
  attr_reader :width, :h_char, :v_char

  def initialize(name)
    @option = 0
    @width = 60
    @h_char = "-"
    @v_char = "|"
    @items = []
    @name = name
  end

  # Displays menu and handles user input
  def display_menu(terminal: false)
    show_header(@name)
    @items.each_with_index do |item, index|
      show_menu_item(index + 1, item)
    end
    show_bar
    @option = validate_menu_selection(selection: true, terminal: terminal)
  end

  def add_menu_item(item)
    @items.push(item)
  end

  # Shows table of accounts (or no accounts if none)
  def show_account_table(accounts, selection: false)
    if accounts.empty?
      show_header("no accounts")
      validate_menu_selection(selection: false)
      return -1
    end

    show_header("accounts")
    left = format("#{@v_char} %s", "Name")
    right = format("%s #{@v_char}", "Amount")
    center = @width - (left.length + right.length)
    puts left + (" " * center).to_s + right
		show_bar
    total = 0

    accounts.each_with_index do |account, index|
      left = format("#{@v_char} %d. %s", index + 1, account.name)
      right = format("$%.2f #{@v_char}", account.payment)
      center = @width - (left.length + right.length)
      puts left + (" " * center).to_s + right
      total += account.payment
    end

    show_bar
    left = format(@v_char.to_s)
    right = format("Total = $%.2f #{@v_char}", total)
    center = @width - (left.length + right.length)
    puts left + (" " * center).to_s + right

    show_bar
    validate_menu_selection(length: accounts.length, selection: selection)
  end

  # Shows table of loans (or no loans if none)
  def show_loan_table(loans, selection: false)
    if loans.empty?
      show_header("No Debts")
      validate_menu_selection(selection: false)
      return -1
    end

    show_header("Debts")
    line = format(" %-10s %12s %9s %7s %8s", "Loan type", "Principal", "Interest", "Months", "Payment")
    print_item(line)

    loans.each_with_index do |item, index|
      line = format(" %d. %-10s %9.2f %10.2f %6d $%.2f", index + 1, item.name, item.amount, item.interest, item.term, item.payment)
      print_item(line)
    end

    show_bar
    validate_menu_selection(length: loans.length, selection: selection)
  end

  # Displays a menu header with centered text
  def show_header(text)
    bar = @h_char * @width
    offset = (@width - text.length) / 2
    left = format("%#{offset}s", @v_char)
    right = format("%-#{offset}s", @v_char)
    puts "\n#{bar}\n#{right}#{text.upcase}#{left}\n#{bar}"
  end

  # Displays menu item
  def show_menu_item(index, text)
    right = format("| %d. ", index)
    offset = ((@width / 2) - text.length) + ((@width / 2) - right.length)
    left = format("%#{offset}s", @v_char)
    puts right + text + left
  end

  # Displays a horizontal bar for menu
  def show_bar
    puts "#{@h_char * @width}\n"
  end

  # Gets user menu input and validates it
  def validate_menu_selection(length: nil, selection: true, terminal: false)
    length = @items.length if length.nil?

    if selection
      if terminal
        print "Enter selection, -1 to quit: "
      else
        print "Enter selection, -1 to go back: "
      end
    else
      print "Any key to continue "
    end

    option = gets.chomp.to_i
    if selection
      while (option <= 0 || option > length) && option != -1
        print "\n invalid selection \n"
        print "Enter selection, -1 to quit: "
        option = gets.chomp.to_i
      end
    end

    @option = option
  end

  # Prints item with vertical bar on left and right
  def print_item(item)
    left = "#{@v_char} #{item}"
    right = @v_char.to_s
    center = @width - (left.length + right.length)
    puts left + (" " * center).to_s + right
  end
end
