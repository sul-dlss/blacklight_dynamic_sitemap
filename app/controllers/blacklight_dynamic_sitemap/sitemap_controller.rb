# frozen_string_literal: true

module BlacklightDynamicSitemap
  ##
  # Controller to handle the on-the-fly sitemap generation
  class SitemapController < ApplicationController
    def show
      @sitemap_entries = BlacklightDynamicSitemap::Sitemap.new.get(id)
    end

    def index
      @sitemaps = BlacklightDynamicSitemap::Sitemap.new.list
    end

    private

    def id
      params.require(:id)
    end
  end
end
