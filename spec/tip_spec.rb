require "spec_helper"
require "hubs3d/model"

describe Hubs3D::Tip do
  let(:model) { described_class.new(amount: 42_00,
                                    currency: "EUR",
                                    uuid: "51",
                                    mandatory: false) }

  describe "#amount" do
    it "returns the amount" do
      expect(model.amount).to eq(42_00)
    end
  end

  describe "#currency" do
    it "returns the currency" do
      expect(model.currency).to eq("EUR")
    end
  end

  describe "#uuid" do
    it "returns the uuid" do
      expect(model.uuid).to eq("51")
    end
  end

  describe "#mandatory" do
    it "returns the mandatory" do
      expect(model.mandatory).to eq(false)
    end
  end
end
