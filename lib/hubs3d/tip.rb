module Hubs3D
  class Tip
    attr_reader :amount, :currency, :uuid, :mandatory

    def initialize(amount: nil,
                   currency: nil,
                   uuid: nil,
                   mandatory: nil)
      @amount = amount
      @currency = currency
      @uuid = uuid
      @mandatory = mandatory
    end

    def to_h
      { amount: amount, currency: currency, uuid: uuid, mandatory: mandatory }
    end
  end
end
