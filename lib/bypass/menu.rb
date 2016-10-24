require_relative 'category_collection'

module Bypass
  class Menu
    attr_reader :concession_id, :meta, :categories

    def initialize(opts = {})
      @concession_id = opts.fetch(:concession_id)
      @meta = opts[:menu]["meta"]

      begin
        if opts[:menu].respond_to?(:string)
          parsed_menu = JSON.parse opts[:menu]
        elsif opts[:menu].respond_to?(:hash)
          parsed_menu = opts[:menu]
        end

      rescue ArgumentError => e
        Rails.logger.error(" The error raised was #{e.inspect}")
      end

      @categories = CategoryCollection.new parsed_menu["categories"]
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
