require_relative 'lib/blacklight_dynamic_sitemap/version'

Gem::Specification.new do |spec|
  spec.name          = 'blacklight_dynamic_sitemap'
  spec.version       = BlacklightDynamicSitemap::VERSION
  spec.authors       = ['Jack Reed']
  spec.email         = ['phillipjreed@gmail.com']

  spec.summary       = 'Dynamic sitemap.xml for BLacklight'
  spec.description   = 'Dynamic sitemap.xml for BLacklight'
  spec.homepage      = 'https://github.com/sul-dlss/blacklight_dynamic_sitemap'
  spec.license       = 'Apache-2.0'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails'
  spec.add_dependency 'blacklight', '> 7.0'

  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'engine_cart', '~> 2.0'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'solr_wrapper'
  spec.add_development_dependency 'rake'
end
