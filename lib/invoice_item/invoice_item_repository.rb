class InvoiceItemRepository
  attr_reader :invoice_items
  def initialize(invoice_items)
    @invoice_items = invoice_items
  end
end
