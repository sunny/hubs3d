require "spec_helper"
require "hubs3d/model"

describe Hubs3D::Tip do
  let(:model) { described_class.new(amount_cents: 42_00,
                                    currency: "EUR",
                                    uuid: "51-42-43",
                                    mandatory: false) }

  describe "#amount_cents" do
    it "returns the amount_cents" do
      expect(model.amount_cents).to eq(42_00)
    end
  end

  describe "#currency" do
    it "returns the currency" do
      expect(model.currency).to eq("EUR")
    end
  end

  describe "#uuid" do
    it "returns the uuid" do
      expect(model.uuid).to eq("51-42-43")
    end
  end

  describe "#mandatory" do
    it "returns the mandatory" do
      expect(model.mandatory).to eq(false)
    end
  end

  describe "#to_h" do
    it "returns a serialized tip" do
      expect(model.to_h).to eq(
        amount: 42_00,
        currency: "EUR",
        uuid: "51-42-43",
        mandatory: false
      )
    end
  end
end
