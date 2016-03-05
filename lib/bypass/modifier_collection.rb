require_relative 'modifier'
require_relative 'concerns/collectible'

module Bypass
  class ModifierCollection
    include Bypass::Collectible
  end
end
