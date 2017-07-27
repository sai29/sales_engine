require_relative "../lib/invoice_item/invoice_item"
describe InvoiceItem do
  describe "Create InvoiceIem" do
    it ".initialize" do
      invoice_item_options = {id: 1,quantity: 5, unit_price: 45, item_id: 26,invoice_id: 34,created_at: "2012-03-25 09:54:09 UTC",updated_at: "2012-03-25 09:54:09 UTC"}
      invoice_item = InvoiceItem.new(invoice_item_options)
      expect(invoice_item).to be_a(InvoiceItem)
      expect(invoice_item.item_id).to eq(26)
      expect(invoice_item.invoice_id).to eq(34)
      # expect(invoice_item.respond_to?(:merchant))
    end
  end

end
