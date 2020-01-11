# frozen_string_literal: true

require 'rails/generators'

module BlacklightDynamicSitemap
  class Install < Rails::Generators::Base
    def add_routes
      inject_into_file 'config/routes.rb', after: "mount Blacklight::Engine => '/'" do
        "\n  mount BlacklightDynamicSitemap::Engine => '/'\n"
      end
    end
  end
end
