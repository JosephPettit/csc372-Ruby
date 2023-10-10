# Class: Dummy
#
# Description:
#   Creates dummy user for testing purposes

class Dummy
  
  attr_accessor :accounts

  def initialize
    auto = Auto.new
    auto.name = "Auto loan"
    auto.term = 36
    auto.amount = 25000.0
    auto.interest = 24.0
    auto.payment = Calculator.monthly_payment(auto)

    electric = Bill.new
    electric.name = "electric"
    electric.payment = 25

    water = Bill.new
    water.name = "water"
    water.payment = 45.25

    card = CreditCard.new
    card.name = "Chase"
    card.amount = 250
    card.payment = 24.50
    card.interest = 24

    @accounts = [auto, electric, water, card]
  end
end