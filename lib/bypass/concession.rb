require_relative 'menu'

module Bypass
  class Concession
    attr_reader :id, :name, :menu

    def initialize(location)
      @id   = location["id"].to_i
      @name = location["name"]
      @menu = Import.menu concession_id: id
    rescue Bypass::ImportError => e
      Rails.logger.warn "Menu #{id} could not be imported: #{e.message}"
      @menu = {}
    end

    def inspect
      {
        id: id.inspect,
        name: name.inspect,
        menu: menu.inspect
      }
    end

    def params
      {
        id: id,
        name: name,
        menu: menu.params
      }
    end
  end
end
