require_relative 'concession_collection'
require 'faraday'

module Bypass
  class ImportError < StandardError
  end

  class Import
    def self.concession(key = default_key)
      response = client(key: key).get do |req|
        req.url concessions_url
      end

      if response.success?
        ConcessionCollection.new(response.body)
      else
        import_error "Concessions", response
      end
    end

    def self.menu(opts = {})
      cid = opts.fetch :concession_id
      key = opts[:key] || default_key

      response = client(key: key).get do |req|
        req.headers
        req.url menu_url(cid)
      end

      if response.success?
        Menu.new(menu: response.body, concession_id: cid)
      else
        import_error "Menu #{concession_id}", response
      end
    end

    private

    def self.default_key
      key = ENV['BYPASS_API_TOKEN']

      unless key
        raise "BYPASS_API_TOKEN must be defined in the environment"
      end

      key
    end

    def self.default_host
      #ENV['BYPASS_API_HOST'] || "https://api.bypassmobile.com"
      ENV['BYPASS_API_HOST'] || "https://data.bypassmobile.com"
    end

    def self.import_error(item, response)
      raise Bypass::ImportError,
            "#{item}: #{error_message(response)}"
    end

    def self.error_message(response)
      "There was an error during import: #{response.inspect}"
    end

    def self.default_headers
      {
        'Accept' => 'application/json',
        'X-BYPASS-API-KEY' => ENV['BYPASS_API_TOKEN'] || nil
      }
    end

    def self.client(opts = {})
      client_headers = default_headers

      if opts[:key]
        client_headers.merge('X-BYPASS-API-KEY' => opts[:key])
      end

      options = {
        url: default_host,
        headers: client_headers
      }

      faraday_with_redirect_support(options) do |c|
        c.request   :url_encoded
        c.response  :json, content_type: /\bjson$/
      end
    end

    def self.faraday_with_redirect_support(opts = {}, &block)
      Faraday.new(opts) { |c|
        yield c
        c.use     FaradayMiddleware::FollowRedirects, limit: 3
        # The Faraday adapter must be defined AFTER the
        # FollowRedirects middleware. See
        # http://blog.thecodewhisperer.com/permalink/losing-time-to-faraday
        c.adapter Faraday.default_adapter
      }
    end

    def self.menu_url(id)
      "/api/venue/concessions/#{id}/menu"
    end

    def self.concessions_url
      "/api/venue/concessions"
    end
  end
end
