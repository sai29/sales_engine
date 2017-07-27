# require_relative "../sales_engine"
# NOTE: On adding sales_engine as required relative here, Invoice being called as SalesEngine::Invoice???
require "pry"
require_relative "../merchant/merchant"
require_relative "../merchant/merchant_repository"

class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :merchant, :customer
  def initialize(options)
    @id = options[:id]
    @customer_id = options[:customer_id]
    @merchant_id = options[:merchant_id]
    @status = options[:status]
    @created_at = options[:created_at]
    @updated_at = options[:updated_at]
  end

  def merchant
    merchant = SalesEngine.merchants.select { |merchant| merchant.id == self.merchant_id }
    puts merchant.inspect
  end

  def customer
    customer = SalesEngine.customers.select { |customer| customer.id == self.customer_id }
    puts customer.inspect
  end


end
