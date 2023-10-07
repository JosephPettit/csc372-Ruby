class Bill
  attr_accessor :name, :payment

  def load_values
    load_name
    load_amount
  end

  def load_name
    print "Enter name of bill: "
    @name = gets.chomp
  end

  def load_amount
    print "Amount: "
    @payment = gets.chomp.to_f
    while @payment < 1
      puts "\nInvalid loan amount entered\n"
      print "Amount: "
      @payment = gets.chomp.to_f
    end
  end
end
