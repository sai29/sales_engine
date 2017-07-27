class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at
  def initialize(options)
    @id = options[:id]
    @name = options[:name]
    @description = options[:description]
    @unit_price =  options[:unit_price]
    @merchant_id = options[:merchant_id]
    @created_at = options[:created_at]
    @updated_at = options[:updated_at]
  end

  def merchant
      merchant = SalesEngine.merchants.select { |merchant| merchant.id == self.merchant_id  }
      puts merchant.inspect
  end





end
