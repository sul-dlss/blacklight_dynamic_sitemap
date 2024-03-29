# Tasks used within the development of BlacklightHeatmaps

require 'solr_wrapper'
require 'engine_cart/rake_task'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc 'Run test suite'
task ci: ['blacklight_dynamic_sitemap:generate'] do
  SolrWrapper.wrap do |solr|
    solr.with_collection(name: 'blacklight-core', dir: File.join(File.expand_path('..', File.dirname(__FILE__)), 'solr', 'conf')) do
      within_test_app do
        system 'RAILS_ENV=test bundle exec rake blacklight:index:seed'
      end
      Rake::Task['spec'].invoke
    end
  end
end

namespace :blacklight_dynamic_sitemap do
  desc 'Generate a test application'
  task generate: ['engine_cart:generate'] do
  end

  desc 'Run Solr and Blacklight for interactive development'
  task :server, [:rails_server_args] do |_t, args|
    if File.exist? EngineCart.destination
      within_test_app do
        system 'bundle update'
      end
    else
      Rake::Task['engine_cart:generate'].invoke
    end

    SolrWrapper.wrap(port: '8983') do |solr|
      solr.with_collection(name: 'blacklight-core', dir: File.join(File.expand_path('..', File.dirname(__FILE__)), 'solr', 'conf')) do

        within_test_app do
          system 'RAILS_ENV=development bundle exec rake blacklight:index:seed'
          system "bundle exec rails s #{args[:rails_server_args]}"
        end
      end
    end
  end
end
