require_relative 'option'
require_relative 'concerns/collectible'

module Bypass
  class OptionCollection
    include Bypass::Collectible
  end
end
