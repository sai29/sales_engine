require "csv"
class SalesEngine
  def startup
    CSV.foreach('data/customers.csv') do |row|
      
    end
  end
end

# engine = SalesEngine.new
# engine.startup
