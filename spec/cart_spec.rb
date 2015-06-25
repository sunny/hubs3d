require "spec_helper"
require "hubs3d/cart"
require "hubs3d/tip"

describe Hubs3D::Cart do
  let(:designer_tip) { Hubs3D::Tip.new(amount_cents: 42_00,
                                       currency: "EUR",
                                       uuid: "5-42-42",
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
    let(:api_result) { { "url" => "http://example" } }

    before do
      allow(Hubs3D::API).to receive(:post) { api_result }
      cart << item
    end

    it "calls the API with the correct args" do
      cart.url
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
          uuid: "5-42-42",
          mandatory: true
        },
        third_party_id: "foo0",
      }
      expect(Hubs3D::API).to have_received(:post).with("/cart", args)
    end

    it "returns the url from the API" do
      expect(cart.url).to eq("http://example")
    end
  end
end
