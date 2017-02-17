require "csv"
require "pry"
require_relative "customer/customer"
require_relative "customer/customer_repository"
require_relative "merchant/merchant"
require_relative "merchant/merchant_repository"
class SalesEngine
  @@customers = []
  @@merchants = []
  def startup
    read_csv("data/customers.csv", "Customer")
    read_csv("data/merchants.csv", "Merchant")
  end

  def read_csv(file, resource)
    CSV.foreach(file, headers:true, :header_converters => :symbol, :converters => :all) do |row|
      case resource
      when "Customer"
        customer = Customer.new(row.to_hash)
        @@customers << customer
      when "Merchant"
        merchant = Merchant.new(row.to_hash)
        @@merchants << merchant
      end
    end

    case resource
    when "Customer"
      return @@customers
    when "Merchant"
      return @@merchants
    end

  end



  def customer_repository
    repository = CustomerRepository.new(@@customers)
    p "Id   FirstName   LastName    created  updated"
    repository.customers.each do |customer|
      p "#{customer.id}   #{customer.first_name}  #{customer.last_name}   #{customer.created_at}  #{customer.updated_at}"
    end
  end

  def merchant_repository
    repository = MerchantRepository.new(@@merchants)
    p "Id   Name    created   Updated"
    repository.merchants.each do |merchant|
      p "#{merchant.id}    #{merchant.name}   #{merchant.created_at}   #{merchant.updated_at}"
    end
  end

end
