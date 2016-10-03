require_relative 'category_collection'

module Bypass
  class Menu
    attr_reader :concession_id, :meta, :categories

    def initialize(opts = {})
      @concession_id = opts.fetch(:concession_id)
      @meta = opts[:menu]["meta"]
      @categories = CategoryCollection.new category_args_from_menu(opts[:menu])
    end

    def inspect
      {
        concession_id: concession_id.inspect,
        meta: meta.inspect,
        categories: categories.inspect
      }
    end

    def params
      {
        concession_id: concession_id,
        meta: meta,
        categories: categories.params
      }
    end

    def category_args_from_menu(menu)
      parsed_menu = JSON.parse(menu)
      parsed_menu["categories"]
    rescue ArgumentError => e
      STDERR.puts "#{self.class.name} could not parse #{menu.inspect}"
      raise e
    end
  end
end
