
class ECommerceStore
  def initialize()
    @users = []
  
  end

  def registra(username, password)
    if valid_username?(username) && valid_password?(password)
      user = User.new(username, password)
      @users << user
      puts "Registration Successful"
    else
      puts "Please enter a valid username and password (a-z A-Z , 2-20 characters)"
      puts "Please logout"
    end
  end

  def login(username, password)
    user = @users.find { |u| u.username == username && u.password == password }
    if user
      $login = true
      puts "Login successful"
    else
      puts "Invalid username and password. Please try again."
    end
  end

  private

  def valid_username?(username)
    /^[a-zA-Z]{2,20}$/.match?(username)
  end

  def valid_password?(password)
    /^[0-9a-zA-Z]{2,20}$/.match?(password)
  end
end

class User
  attr_accessor :username, :password, :login

  def initialize(username, password)
    @username = username
    @password = password
    
  end
end
