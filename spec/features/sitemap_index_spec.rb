# frozen_string_literal: true

RSpec.describe 'Sitemap Index', type: :feature do
  it 'renders XML with a root element' do
    visit blacklight_dynamic_sitemap.sitemap_index_path

    expect(page).to have_xpath('//sitemapindex')
  end
  it 'renders at least 16 <sitemap> elements' do
    visit blacklight_dynamic_sitemap.sitemap_index_path
    expect(page).to have_xpath('//sitemap', count: 16)
  end
end
