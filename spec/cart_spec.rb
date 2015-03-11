require "spec_helper"
require "hubs3d/cart"

describe Hubs3D::Cart do
  let(:cart) { Hubs3D::Cart.new }
  let(:item) { Minitest::Mock.new }

  describe "#items" do
    it "defaults to empty" do
      cart.items.empty?.must_equal true
    end
  end

  describe "#<<" do
    it "adds items" do
      cart << item
      cart << item
      cart.items.size.must_equal 2
    end
  end

  describe "#url" do
    before do
      cart << item
      item.expect :id, 42
      item.expect :id, 42
    end

    it "calls the API" do
      # params = { items: { modelId: 42, quantity: 1 } }
      returned = { url: "http://example" }
      Hubs3D::API.stub :post, "/cart", returned do
        cart.url.must_equal "http://example"
      end
    end
  end
end
