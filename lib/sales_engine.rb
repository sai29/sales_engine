require "csv"
require "pry"
require_relative "customer/customer"
require_relative "customer/customer_repository"
require_relative "merchant/merchant"
require_relative "merchant/merchant_repository"
require "./lib/invoice/invoice"
require_relative "invoice/invoice_repository"
require "./lib/item/item"
require_relative "item/item_repository"
require "./lib/invoice_item/invoice_item"
require_relative "invoice_item/invoice_item_repository"
class SalesEngine
  @@customers = []
  @@merchants = []
  @@invoices = []
  @@items = []
  @@invoice_items = []

  def self.items
    @@items
  end

  def self.customers
    @@customers
  end

  def self.merchants
    @@merchants
  end

  def self.invoices
    @@invoices
  end

  def self.invoice_items
    @@invoice_items
  end

  def startup
    read_csv("data/customers.csv", "Customer")
    read_csv("data/merchants.csv", "Merchant")
    read_csv("data/invoices.csv", "Invoice")
    read_csv("data/items.csv", "Item")
    read_csv("data/invoice_items.csv", "InvoiceItem")
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
      when "Invoice"
        invoice = Invoice.new(row.to_hash)
        @@invoices << invoice
      when "Item"
        item = Item.new(row.to_hash)
        @@items << item
      when "InvoiceItem"
        invoice_item = InvoiceItem.new(row.to_hash)
        @@invoice_items << invoice_item
      end
    end

    case resource
    when "Customer"
      return @@customers
    when "Merchant"
      return @@merchants
    when "Invoice"
      return @@invoices
    when "Item"
      return @@items
    when "InvoiceItem"
      return @@invoice_items
    end
  end

  def customer_repository
    repository = CustomerRepository.new(@@customers)
    p "Id   FirstName   LastName    created  updated"
    repository.customers.each do |customer|
      p "#{customer.id}   #{customer.first_name}  #{customer.last_name}   #{customer.created_at}  #{customer.updated_at}"
    end
    return repository
  end

  def merchant_repository
    repository = MerchantRepository.new(@@merchants)
    p "Id   Name    created   Updated"
    repository.merchants.each do |merchant|
      p "#{merchant.id}    #{merchant.name}   #{merchant.created_at}   #{merchant.updated_at}"
    end
    return repository
  end

  def invoice_repository
    repository = InvoiceRepository.new(@@invoices)
    p "Id   Name    created   Updated"
    repository.invoices.each do |invoice|
      p "#{invoice.id}    #{invoice.merchant_id}   #{invoice.customer_id}   #{invoice.updated_at}"
    end
    return repository
  end

  def item_repository
    repository = ItemRepository.new(@@items)
    p "Id   Name    created   Updated"
    repository.items.each do |item|
      p "#{item.id}    #{item.merchant_id}   #{item.unit_price}   #{item.updated_at}"
    end
    return repository
  end

  def invoice_item_repository
    repository = InvoiceItemRepository.new(@@invoice_items)
    p "Id    ItemId   InvoiceID "
    repository.invoice_items.each do |invoice_item|
      p "#{invoice_item.id}    #{invoice_item.item_id}   #{invoice_item.invoice_id} "
    end
    return repository
  end

end

engine = SalesEngine.new
engine.startup
engine.invoice_repository.invoices.first.customer
engine.item_repository.items.first.merchant
puts engine.invoice_item_repository
