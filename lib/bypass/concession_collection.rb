require_relative 'concession'
require_relative 'concerns/collectible'

module Bypass
  class ConcessionCollection
    include Bypass::Collectible
  end
end
