require "spec_helper"
require "hubs3d/cart"
require "hubs3d/tip"

describe Hubs3D::Cart do
  let(:designer_tip) { Hubs3D::Tip.new(amount: 42_00,
                                       currency: "EUR",
                                       uuid: 5,
                                       mandatory: true) }
  let(:cart) { described_class.new(designer_tip: designer_tip,
                                   third_party_id: "foo0") }
  let(:item) { double(:item, id: 42) }

  describe "#designer_tip" do
    it "returns the designer_tip" do
      expect(cart.designer_tip).to eq(designer_tip)
    end
  end

  describe "#third_party_id" do
    it "returns the third_party_id" do
      expect(cart.third_party_id).to eq("foo0")
    end
  end

  describe "#items" do
    it "defaults to empty" do
      expect(cart.items.empty?).to eq(true)
    end
  end

  describe "#<<" do
    it "adds items" do
      cart << item
      cart << item
      expect(cart.items.size).to eq(2)
    end
  end

  describe "#url" do
    it "returns the url from the API" do
      allow(cart).to receive(:post).and_return({"url" => "http://example"})
      cart << item

      expect(cart.url).to eq("http://example")
    end
  end

  describe "#post" do
    it "calls the API with the correct args" do
      args = {
        items: {
          42 => {
            modelId: 42,
            quantity: 1,
          },
        },
        designer_tip: {
          amount: 42_00,
          currency: "EUR",
          uuid: 5,
          mandatory: true
        },
        third_party_id: "foo0",
      }

      cart << item
      expect(Hubs3D::API).to receive(:post).with("/cart", args)

      cart.send(:post)
    end
  end
end
