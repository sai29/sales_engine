require "csv"
require_relative '../lib/sales_engine'
require "pry"

describe SalesEngine do
  describe ".read_csv" do
    let(:engine) { SalesEngine.new }

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
end
