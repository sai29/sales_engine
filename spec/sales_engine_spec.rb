require 'sales_engine'

describe SalesEngine do
  describe "startup" do
    it "returns objects with relationships" do
        expect(SalesEngine.new.startup).to eql(true)
    end
  end
end
