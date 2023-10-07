# csc372-Ruby

## John Gumm & Joe Pettit

### Program overview

Basic menu to store loan information, calculate monthly payments, calculate amortization table.

### Run instructions

from the command line

```bash
ruby Main.rb
```

Interactive command line menu will start 

### Future improvements

(These are just a few ideas, we are open to suggestions or feedback)

- option to edit loan
- save data to csv / json file
- option for multiple users
- calculate expected pay off of credit card given balance, monthly payment and interest rate.
- add option to pay off loan early (pay extra)

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
# loan_menu.display returns 1-3
# loan is then assigned based on the result
loan = case loan_menu.display_menu
    when 1
      Auto.new
    when 2
      Mortgage.new
    when 3
      Personal.new
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
until false do 
    # infinite loop
end 

while true do 
    # equivalent loop
end 

``` 

### Magic Comments

In Ruby, special "magic" comments contain directives that change the way code is interpreted.

```ruby
# frozen_string_literal: true
```

This is an example of a magic comment. This will cause Ruby to always treat two similar strings as distinct objects.

### Duck Typing 

In Ruby everything is an object, and the type of object doesn't matter as long as that object has the attributes or methods needed.

```ruby 
class 
    @name = Copper 
    def speak
        puts "I'm a hound dog"
    end
end 

class Fox 
    @name = Tod 
    def speak
        puts "I'm a fox"
    end 
end 

def who_are_you(somebody)
    puts "My name is #{somebody.name}"
    somebody.speak
end

doggo = Dog.new
foxy = Fox.new

who_are_you(doggo) 
# My name is Copper
# I'm a hound dog

who_are_you(foxy)
# My name is Tod
# I'm a Fox
```

in the example above, the function who_are_you doesn't know / care what type of object is passed in. All that matters is that it has a name attribute and the speak method. 