
#    Menu:
#    A menu class which is used to display the menu.
#    User input will be used to navigate the menu.
class Menu
  attr_accessor :option

  def initialize(name)
    @option = -1
    @width = 60
    @h_char = "-"
    @v_char = "|"
    @items = []
    @name = name
  end

  def display_menu
    show_header(@name)
    @items.each_with_index do |item, index|
      show_menu_item(index + 1, item)
    end
    show_footer
    @option = validate_menu_selection
  end

  def add_menu_item(item)
    @items.push(item)
  end

  def show_loan_table(loans, selection: false)
    if loans.empty?
      show_header("no loans")
      validate_menu_selection(selection: false)
      return -1
    end

    show_header("loans")
    puts format("| %-10s %12s %9s %7s %8s", "Loan type", "Principal", "Interest", "Months", "Payment")
    loans.each_with_index do |item, index|
      line = format("| %d. %-10s %9.2f %10.2f %6d $%.2f", index + 1, item.class, item.amount, item.interest, item.term,
                    item.payment)
      offset = @width - line.length
      right = format("%#{offset - 1}s", @v_char)
      puts line + right
    end

    show_footer
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

  def show_footer
    puts "#{@h_char * @width}\n"
  end

  def validate_menu_selection(length: nil, selection: true)
    if length.nil?
      length = @items.length
    end

    if selection
      print "Enter selection, -1 to quit: "
    else
      print "Any key to continue "
    end

    option = gets.chomp.to_i
    while !selection && ((option < 0) || (option > length)) && (option != -1)
      print "\n invalid selection \n"
      print "Enter selection, -1 to quit: "
      option = gets.chomp.to_i
    end
    @option = option
  end
end
