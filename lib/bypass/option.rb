require 'pry'

module Bypass
  class Option
    attr_reader :id, :name, :price, :quantity

    def initialize(option)
      @name     = option["name"]
      @id       = option["id"].to_i
      @price    = (option["price"].to_f * price_base_unit_multiplier).to_i
      @quantity = option["quantity"].to_i
    end

    def inspect
      {
        id: id.inspect,
        name: name.inspect,
        price: price.inspect,
        quantity: quantity.inspect
      }
    end

    def params
      {
        id: id,
        name: name,
        price: price,
        quantity: quantity
      }
    end

    private

    def price_base_unit_multiplier
      100
    end
  end
end
