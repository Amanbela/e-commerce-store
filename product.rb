require 'csv'
class ExportCsv
  def initialize(arr)
    @arr=arr
  end
  def export
   # CSV=File.new
   
   CSV.open("ExportData.csv","a+") do|csv|
    # csv << ["Name","Brand","price"]
    @arr.each do|arr|
       csv<<[arr["Name"],arr["Brand"],arr["Price"]]
     end
     # @users.each do|users|
     #  csv<<[users["username"],users["password"]]
     #end
   end
    puts "--export data into csv"


  end
end
