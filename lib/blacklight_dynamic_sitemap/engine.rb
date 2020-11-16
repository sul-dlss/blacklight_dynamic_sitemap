# frozen_string_literal: true

module BlacklightDynamicSitemap
  class Engine < ::Rails::Engine
    isolate_namespace BlacklightDynamicSitemap
    config.max_documents_expiration = 1.day
    config.minimum_average_chunk = 10_000
    config.hashed_id_field = 'hashed_id_ssi'
    config.unique_id_field = 'id'
    config.last_modified_field = 'timestamp'
    config.modify_show_params = nil # lambda { |id, default_params| default_params }
    config.modify_index_params = nil # lambda { |default_params| default_params }
    config.format_last_modified = nil # lambda { |raw_last_modified| raw_last_modified }
  end
end
