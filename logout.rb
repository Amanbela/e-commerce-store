class Logout
  def initialize(current_log)
    @current_log=current_log
  end
  def log_out
    @current_log=nil
    puts"Logut Successfully !"
    return
  end
end