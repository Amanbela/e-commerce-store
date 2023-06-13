
require_relative 'search'
require_relative 'browse'
require_relative 'addtocart'
require_relative 'product'
require_relative 'addtocart'
require_relative 'logout'

class User
  def initialize(current_log)
    @arr=[]
    @cart=[]
    @current_log=current_log
  end
    
  def user_menu
    
    loop do
      cart=Cart.new(@arr,@cart,@current_log)
     
   
      puts"--------------------------------------"
      puts"------welcome to E-commerce Store-----"
      puts" welcome user good day"
      puts"1. add the product"
      puts"2. Browse Products"
      puts"3. Search Products"
      puts"4. Add to Cart"
      puts"5. View Cart"
      puts"6. Checkout"
      puts"7. View Order History"
      puts"8. csv file export"
   
      puts"9. Logout"
    
      print"Enter your choice:"
      choice=gets.chomp.to_i

      case choice
       when 1
        Browse.new(@arr,@current_log).add_product
       when 2  
        listing=Browse.new(@arr,@current_log).product_list
       when 3
         search=Search.new(@arr)
         search.search
       when 4
        cart.add_to_cart

       when 5 
         cart.display_cart

       when 6
         cart.check_out
    
       when 7
         cart.order_history
         
       when 8
    
         exp=ExportCsv.new(@arr)
         exp.export
         
       when 9
        Logout.new(@current_log).log_out
       Exit
      else
        puts "Invalid choice please try agin"
     
      end
    end 
  end
end