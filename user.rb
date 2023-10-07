#   User:
#   A user class which is used to save user data.

class User
  attr_accessor :accounts

  def initialize
    @accounts = []
  end
end
