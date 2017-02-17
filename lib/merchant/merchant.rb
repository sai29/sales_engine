class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(options)
    @id = options[:id]
    @name = options[:name]
    @created_at = options[:created_at]
    @updated_at = options[:updated_at]
  end

end
