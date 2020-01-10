# frozen_string_literal: true

RSpec.describe 'Stiemap Index', type: :feature do
  it 'renders XML with a root element' do
    visit blacklight_dynamic_sitemap.sitemap_index_path

    expect(page.body).to match('<root/>')
  end
end
