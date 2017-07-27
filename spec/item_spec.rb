require "csv"
require_relative '../lib/item/item'
require "pry"

describe Item do
  describe "Create Item" do
    it ".initialize" do
      item = { id: 6, name: "Pretzel",description:"Make you thirsty",unit_price: "24.25",merchant_id:45,created_at:"2012-03-27 14:54:09 UTC",updated_at:"2013-03-27 14:54:09 UTC" }
      item = Item.new(item)
      expect(item).to be_a(Item)
      expect(item.unit_price).to eq("24.25")
    end
  end
end
