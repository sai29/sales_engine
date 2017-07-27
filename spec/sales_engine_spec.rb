require "csv"
require_relative '../lib/sales_engine'
require "pry"

describe SalesEngine do
  let(:engine) { SalesEngine.new }
  describe ".read_csv" do


    customer_csv_file = CSV.open("customer_csv_file", "wb") do |csv|
      csv << ["id", "first_name", "last_name", "created_at", "updated_at"]
      csv << [1, "Jerry", "Seinfeld", "2011-03-27 14:54:09 UTC", "2012-03-27 14:54:09 UTC"]
      csv << [2, "George", "Cantstandya", "2012-03-27 14:54:09 UTC", "2013-03-27 14:54:09 UTC"]
      csv << [3, "Cosmo", "Kramer", "2015-03-27 14:54:09 UTC", "2016-03-27 14:54:09 UTC"]
    end

    it "reads csv and creates customer repository" do
        customers = engine.read_csv(customer_csv_file.path, "Customer")
        expect(customers.count).to eq(3)
    end
  end

  describe ".customer_repository" do
    it "has same count as number of customers" do
      repository = engine.customer_repository
      expect(repository.customers).to eq(SalesEngine.customers)
    end
  end

  describe ".merchant_repository" do
    it "has same count as number of merchants" do
      repository = engine.merchant_repository
      expect(repository.merchants).to eq(SalesEngine.merchants)
    end
  end

  describe ".invoice_repository" do
    it "has same count as number of invoices" do
      repository = engine.invoice_repository
      expect(repository.invoices).to eq(SalesEngine.invoices)
    end
  end
  describe ".items_repository" do
    it "has same count as number of items" do
      repository = engine.item_repository
      expect(repository.items).to eq(SalesEngine.items)
    end
  end


end
