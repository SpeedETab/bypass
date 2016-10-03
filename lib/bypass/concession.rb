require_relative 'menu'

module Bypass
  class Concession
    attr_reader :id, :name

    def initialize(location)
      @id   = location["id"].to_i
      @name = location["name"]
    end

    def menu
      @menu ||= Import.menu(concession_id: id)
    rescue ImportError
      Rails.logger.warn "Menu import error for concession #{id}"
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
