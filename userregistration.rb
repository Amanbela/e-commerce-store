require_relative 'user'
require_relative 'helpar_class'
class UserRegistration
  def initialize(users,current_log)
    @users = users
    @current_log = current_log
     
  end

  def registra(username, password)
    if valid_username?(username) && valid_password?(password)
      user = Value.new(username, password)
      @users << user
      puts "Registration Successful"
    else
      puts "Please enter a valid username and password (a-z A-Z, 2-20 characters)"
    end
  end

  def login
    if @users.empty?
      puts "First, You need to registered yourself"
    else
      puts "enter your username"
      username=gets.chomp
      
      puts "enter your password"
      password = IO::console.getpass

      s=password.length
      for i in 0...s.to_i
        print "*"
      end

      l = @users.length
      count = 0

      @users.each do |check|
        begin
          found_user = check.username == username && check.password == password
          if found_user
              @current_log = username
              puts "\nLogin successfully !!!"
              User.new(@current_log).user_menu
          else
            count = count + 1
            raise
          end
        rescue
          if count < l
            puts ""
          else
             puts "Invalid username or password"
             return
          end
        end
      end
    end        
  end
  

  private

  def valid_username?(username)
    /^[a-zA-Z]{2,20}$/ =~ username
  end

  def valid_password?(password)
    /^[0-9a-zA-Z]{2,20}$/ =~ password
  end
end
