
require_relative 'search'
require_relative'browse'
require_relative 'addtocart'
require_relative 'product'
require_relative 'addtocart'

class User2
  def initialize
    @arr=[]
    @cart=[]
  
    end
    
  def user1
    
    loop do
      cart=Cart.new(@arr,@cart)
      listing=Browse.new(@arr)
   
     puts"--------------------------------------"
     puts"------welcome to E-commerce Store-----"
     puts" welcome user good day"
     puts"2. add the product"
     puts"3. Browse Products"
     puts"4. Search Products"
     puts"5. Add to Cart"
     puts"6. View Cart"
     puts"7. Checkout"
     puts"8. View Order History"
     puts"9. csv file export"
   
     puts"10. Exit"
    
     print"Enter your choice:"
     choice=gets.chomp.to_i

     case choice
     when 2
      listing.Add_product
     when 3
     
     if $login==true
     listing.product_list
     else 
      puts "first login than use function"
     end

     when 4
      
      search=Search.new(@arr)
    
     if $login==true
     search.search
     else
      puts "first login than use function"
     end

     when 5
     
     if $login==true
     cart.add_to_cart
     else 
      puts" first login than use function"
     end

     when 6 
      #cart=Cart.new(@arr)
      if $login==true
         cart.display_cart
        else
        puts"first login than use function"
      end

      when 7
       #cart=Cart.new(@arr)
      if $login=true
       cart.check_out
      else
       puts "first login than use function"
      end
    
      when 8
       #cart=Cart.new(@arr)
       if $login==true
        cart.order_history
       else
        puts"first login than use function"
      end
      when 9
    
       exp=ExportCsv.new(@arr)
       if $login==true
       exp.Export
       else
        puts"first input the data in array then use function"
     end


      when 10
       $login=false
       exit
       else
       puts "Invalid choice please try agin"
     
      end
    end


   
  end

end