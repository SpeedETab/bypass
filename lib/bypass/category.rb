require_relative 'item_collection'

module Bypass
  class Category
    attr_reader :id, :name, :items

    def initialize(category)
      @id   = category["id"].to_i
      @name = category["name"]
      @items = ItemCollection.new(category["items"])
    end

    def inspect
      {
        id: id.inspect,
        name: name.inspect,
        items: items.inspect
      }
    end

    def params
      {
        id: id,
        name: name,
        items: items.params
      }
    end
  end
end
