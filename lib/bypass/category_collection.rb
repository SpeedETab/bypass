require_relative 'category'
require_relative 'concerns/collectible'

module Bypass
  class CategoryCollection
    include Bypass::Collectible

    private

    def member_class
      Category
    end
  end
end
