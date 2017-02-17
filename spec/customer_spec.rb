require_relative '../lib/customer/customer'
require "pry"

describe Customer do

  describe "Create customer" do
    it ".initialize" do
      customer_options = { id: 1, first_name: "Jerry", last_name: "Seinfeld", created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"}
      customer = Customer.new(customer_options)
      expect(customer.first_name).to eq("Jerry")
      expect(customer.last_name).to eq("Seinfeld")
    end
  end
end
