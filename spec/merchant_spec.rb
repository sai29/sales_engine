require_relative "../lib/merchant/merchant"
require "pry"

describe Merchant do

  describe "Create Merchant" do
    it ".initialize" do
      merchant_options = { id: 1, name: "Art Vandalay", created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"}
      merchant = Merchant.new(merchant_options)
      expect(merchant).to be_a(Merchant)
      expect(merchant.name).to eq("Art Vandalay")
      expect(merchant.id).to eq(1)
    end
  end
end
