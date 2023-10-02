#   User:
#   A user class which is used to save user data. 
#   Allows for 5 loans at once per user per session.
class User
    attr_accessor :loans
    def initialize
        @loans = []
    end

end