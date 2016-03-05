require_relative 'item'
require_relative 'concerns/collectible'

module Bypass
  class ItemCollection
    include Bypass::Collectible

    private

    def member_class
      Item
    end
  end
end
