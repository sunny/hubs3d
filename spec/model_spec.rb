require "spec_helper"
require "hubs3d/model"

describe Hubs3D::Model do
  let(:model) do
    described_class.new(name: "Foo",
                        path: "example.stl",
                        attachments: [{foo: "bar"}])
  end

  describe "#name" do
    it "returns the name" do
      expect(model.name).to eq("Foo")
    end
  end

  describe "#path" do
    it "returns the path" do
      expect(model.path).to eq("example.stl")
    end
  end

  describe "#id" do
    it "triggers #post if @id is not set" do
      expect(model).to receive(:post).and_return({})
      model.id
    end

    it "only returns @id if it is already set" do
      model.instance_variable_set(:@id, 3)
      expect(model).to_not receive(:post)
      model.id
    end
  end

  describe "#attachments" do
    it "returns the attachments" do
      expect(model.attachments).to match_array [{foo: "bar"}]
    end
  end

  describe "#base_64" do
    it "reads the file contents and returns the base64 representation" do
      string_io = StringIO.new("foobar")
      expect(model).to receive(:open).with("example.stl", "r").and_yield(string_io)
      expect(model.send(:base_64)).to eq "Zm9vYmFy\n"
    end
  end

  describe "#post" do
    it "fires a POST request with the right parameters" do
      allow(model).to receive(:base_64).and_return("foobar")

      expect(Hubs3D::API).to receive(:post).with("/model",
                                         file: "foobar",
                                         fileName: "Foo",
                                         attachments: [{foo: "bar"}])

      model.send(:post)
    end
  end
end
