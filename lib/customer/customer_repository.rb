class CustomerRepository
  attr_accessor :customers

  def initialize(customers)
    @customers = customers
  end
end
