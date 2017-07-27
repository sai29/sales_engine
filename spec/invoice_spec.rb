require_relative "../lib/invoice/invoice"
describe Invoice do
  describe "Create Invoice" do
    it ".initialize" do
      invoice_options = {id: 1,customer_id: 1,merchant_id: 26,status: "shipped",created_at: "2012-03-25 09:54:09 UTC",updated_at: "2012-03-25 09:54:09 UTC"}
      invoice = Invoice.new(invoice_options)
      expect(invoice.merchant_id).to eq(26)
      expect(invoice.status).to eq("shipped")
      expect(invoice.respond_to?(:merchant))
    end
  end

end
