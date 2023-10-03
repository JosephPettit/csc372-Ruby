#   User:
#   A user class which is used to save user data.

class User
  attr_accessor :loans

  def initialize
    @loans = []
  end
end
