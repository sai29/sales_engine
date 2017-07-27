class InvoiceItem
  attr_reader :id,:item_id, :invoice_id, :created_at, :updated_at
  def initialize(options)
    @id = options[:id]
    @quantity = options[:quantity]
    @unit_price = options[:unit_price]
    @item_id = options[:item_id]
    @invoice_id = options[:invoice_id]
    @created_at = options[:created_at]
    @updated_at = options[:updated_at]
  end

end
