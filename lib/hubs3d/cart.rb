module Hubs3D
  class Cart
    attr_reader :items, :designer_tip, :third_party_id

    def initialize(designer_tip: nil,
                   third_party_id: nil)
      @items = []
      @designer_tip = designer_tip
      @third_party_id = third_party_id
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

      API.post("/cart", items: hash,
                        designer_tip: designer_tip && designer_tip.to_h,
                        third_party_id: third_party_id)
    end
  end
end
