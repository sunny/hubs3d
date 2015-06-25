module Hubs3D
  class Tip
    attr_reader :amount_cents, :currency, :uuid, :mandatory

    def initialize(amount_cents: nil,
                   currency: nil,
                   uuid: nil,
                   mandatory: nil)
      @amount_cents = amount_cents
      @currency = currency
      @uuid = uuid
      @mandatory = mandatory
    end

    def to_h
      { amount: amount_cents,
        currency: currency,
        uuid: uuid,
        mandatory: mandatory }
    end
  end
end
