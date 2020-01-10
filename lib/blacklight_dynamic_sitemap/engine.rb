# frozen_string_literal: true

module BlacklightDynamicSitemap
  class Engine < ::Rails::Engine
    isolate_namespace BlacklightDynamicSitemap
    config.max_documents_expiration = 1.day
    config.minimum_average_chunk = 10_000
    config.hashed_id_field = 'hashed_id_ssi'
    config.unique_id_field = 'id'
    config.last_modified_field = 'timestamp'
  end
end
