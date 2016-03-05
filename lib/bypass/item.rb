require_relative 'modifier_collection'

module Bypass
  class Item
    attr_reader :id, :name, :price, :modifiers

    def initialize(item)
      @price    = (item["price"].to_f * price_base_unit_multiplier).to_i
      @name     = item["name"]
      @id       = item["id"]
      @modifiers = ModifierCollection.new item["modifiers"]
    end

    def inspect
      {
        id: id.inspect,
        name: name.inspect,
        price: price.inspect,
        modifiers: modifiers.inspect
      }
    end

    def params
      {
        id: id,
        name: name,
        price: price,
        modifiers: modifiers
      }
    end

    private

    def price_base_unit_multiplier
      100
    end
  end
end
