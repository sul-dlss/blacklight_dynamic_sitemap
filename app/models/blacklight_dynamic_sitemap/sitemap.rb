# frozen_string_literal: true

module BlacklightDynamicSitemap
  ##
  #
  class Sitemap
    delegate :hashed_id_field, :unique_id_field, :last_modified_field, to: :engine_config

    def get(id)
      index_connection.select(
        params: {
          q: "{!prefix f=#{hashed_id_field} v=#{id}}",
          fl: [unique_id_field, last_modified_field].join(',')
        }
      ).dig('response', 'docs')
    end

    def list
      access_list
    end

    private

    def index_connection
      @index_connection ||= Blacklight.default_index.connection
    end

    def engine_config
      BlacklightDynamicSitemap::Engine.config
    end

    def max_documents
      key = 'blacklight_dynamic_sitemap.index_max_docs'
      expiration = BlacklightDynamicSitemap::Engine.config.max_documents_expiration
      Rails.cache.fetch(key, expires_in: expiration) do
        Blacklight.default_index.connection.select(
          params: { q: '*:*', rows: 0 }
        )['response']['numFound']
      end
    end

    def average_chunk
      [10_000, max_documents].min # Sufficiently less than 50,000 max per sitemap
    end

    def access_list
      access = (Math.log(max_documents / average_chunk) / Math.log(16)).ceil
      (0...(16**access))
        .to_a
        .map { |v| v.to_s(16).rjust(access, '0') }
    end
  end
end
