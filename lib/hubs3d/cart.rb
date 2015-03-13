require "hubs3d/api"

module Hubs3D
  class Cart
    attr_reader :items

    def initialize
      @items = []
    end

    def <<(item)
      @items << item
    end

    def url(options = {})
      @url ||= post.fetch("url")
    end


    private

    def post
      fail "Cart is empty" if @items.compact.empty?

      hash = {}
      @items.each do |item|
        hash[item.id] = { modelId: item.id, quantity: 1 }
      end

      API.post("/cart", items: hash)
    end
  end
end
