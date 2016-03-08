require_relative 'category_collection'

module Bypass
  class Menu
    attr_reader :concession_id, :meta, :categories

    def initialize(opts = {})
      @concession_id = opts.fetch(:concession_id)
      @meta = opts[:menu]["meta"]
      @categories = CategoryCollection.new JSON.parse(opts[:menu])["categories"]
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
  end
end
