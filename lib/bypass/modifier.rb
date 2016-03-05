require 'pry'
require_relative 'option_collection'

module Bypass
  class Modifier
    attr_reader :id, :name, :options

    def initialize(modifier)
      @name     = modifier["name"]
      @id       = modifier["id"]
      @options  = OptionCollection.new modifier["options"]
    end

    def inspect
      {
        id: id.inspect,
        name: name.inspect,
        options: options.inspect
      }
    end

    def params
      {
        id: id,
        name: name,
        options: options
      }
    end

    private

    def price_base_unit_multiplier
      100
    end
  end
end
