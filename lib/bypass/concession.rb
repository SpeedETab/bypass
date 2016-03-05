require_relative 'menu'

module Bypass
  class Concession
    attr_reader :id, :name, :menu

    def initialize(location)
      @id   = location["id"].to_i
      @name = location["name"]
      @menu = get_menu
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

    private

    def get_menu
      Menu.new(JSON.parse(Import.menu id), concession_id: id)
    end
  end
end
