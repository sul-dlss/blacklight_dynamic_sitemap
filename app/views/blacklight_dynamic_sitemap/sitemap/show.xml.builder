# frozen_string_literal: true

xml.instruct! :xml, version: '1.0', encoding: 'UTF-8'
xml.urlset(
  'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
  'xsi:schemaLocation' => 'http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd',
  'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9'
) do
  @sitemap_entries.each do |doc|
    xml.url do
      xml.loc(main_app.solr_document_url(doc[BlacklightDynamicSitemap::Engine.config.unique_id_field]))
      xml.lastmod(doc[BlacklightDynamicSitemap::Engine.config.last_modified_field])
    end
  end
end
