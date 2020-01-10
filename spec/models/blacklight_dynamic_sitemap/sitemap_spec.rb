# frozen_string_literal: true

RSpec.describe BlacklightDynamicSitemap::Sitemap do
  describe '#access_list' do
    it 'by default will at least represent the full hexadecimal space' do
      expect(subject.list.length).to eq 16
    end

    it 'with larger documents will exponentially expand' do
      allow(subject).to receive(:max_documents).and_return(10_000_000)
      expect(subject.list.length).to eq 4096
    end
  end
end
