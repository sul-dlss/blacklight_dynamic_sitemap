# frozen_string_literal: true

RSpec.describe 'Stiemap Show', type: :feature do
  it 'renders XML with a root element' do
    visit blacklight_dynamic_sitemap.sitemap_path('1')

    expect(page.body).to match('<root/>')
  end
end
