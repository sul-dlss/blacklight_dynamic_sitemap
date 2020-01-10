# frozen_string_literal: true

RSpec.describe 'Sitemap Show', type: :feature do
  it 'renders XML with a root element' do
    visit blacklight_dynamic_sitemap.sitemap_path('1')

    expect(page).to have_xpath('//urlset')
  end
  it 'renders <url> elements' do
    visit blacklight_dynamic_sitemap.sitemap_path('1')
    expect(page).to have_xpath('//url', count: 6)
  end
end
