# csc372-Ruby

## John Gumm & Joe Pettit

### Video link

https://youtu.be/980ixaKptzU

### Program overview

Basic menu to store loan information, calculate monthly payments, calculate amortization table.

### Run instructions

from the command line

```bash
ruby Main.rb
```

Interactive command line menu will start

### Language feature highlights

#### attr_accessors

```ruby
class Loan 
attr_accessor :amount, :interest, :term, :payment
```

instead of getter and setter functions Ruby has attribute accessors. The above example will allow reading and writing of all listed variables. There are settings for just reading, and just writing to the specified variables.

#### Variables

```Ruby
@@counter  # All instances share this variable <- Not available in Java
@term      # Instance variable (Similar to 'this' in Java)
```

### case statements

Instead of switch statements, ruby uses case statements.

```ruby
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
```

### falsey values

Like C, Ruby uses truthy and falsey values. In Ruby only false and nil evaluate to false, everything else is truthy.

```ruby
if loan # Checks if loan is nil 
    loan.load_values()
end 
```

### until loop

Ruby has until loops that are identical to a while loop, but runs while false.

```ruby
until main_menu.option == -1
    # Main menu loop
end
```

### Magic Comments

In Ruby, special "magic" comments contain directives that change the way code is interpreted.

```ruby
# frozen_string_literal: true
```

This is an example of a magic comment. This will make all strings immutable. 

### Duck Typing

In Ruby everything is an object, and the type of object doesn't matter as long as that object has the attributes or methods needed.

```ruby
# Shows table of accounts (or no accounts if none)
  def show_account_table(accounts, selection: false)
    if accounts.empty?
      show_header("no accounts")
      validate_menu_selection(selection: false)
      return -1
    end

	  # Formating code here 
 	
    total = 0

    accounts.each_with_index do |account, index|
      left = format("#{@v_char} %d. %s", index + 1, account.name)
      right = format("$%.2f #{@v_char}", account.payment)
      center = @width - (left.length + right.length)
      puts left + (" " * center).to_s + right
      total += account.payment
    end

	  # More formatting code here

  end

```

In the example above, the function takes in an argument accounts which is a list of objects that can be a type of loan or a credit card. As long as the account item has a name, and payment field the function will function correctly.

### Static Methods

In Ruby to declare a static method, you add 'self' to the function name. For example:

```Ruby
class Calculator
  # Calculates monthly payment for loan
  def self.monthly_payment(loan)
    (loan.amount * (loan.interest / 1200)) / (1 - (1 + (loan.interest / 1200))**-loan.term)
  end
end 
```

monthly_payment can be called without an instance of a Calculator object like so:

``` Ruby
Calculator.monthly_payment(loan)
```
