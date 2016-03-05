require_relative 'category_collection'

module Bypass
  class Menu
    attr_reader :concession_id, :meta, :categories

    def initialize(menu_hash, opts = {})
      @concession_id = opts.fetch(:concession_id)
      @meta = menu_hash["meta"]
      @categories = CategoryCollection.new(menu_hash["categories"])
    end

    def inspect
      {
        concession_id: concession_id.inspec,
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
  end
end
