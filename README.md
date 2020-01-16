# BlacklightDynamicSitemap

Builds dynamic sitemaps that scale for your Blacklight applications.

Based on original work here: https://github.com/sul-dlss/SearchWorks/pull/2351

Concept developped by:
@magibney
@mejackreed
@agazzarini
@netsensei

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'blacklight_dynamic_sitemap'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install blacklight_dynamic_sitemap

Run the install generator

    $ bundle exec rails generate blacklight_dynamic_sitemap:install

## Usage

### Solr configuration
This feature relies on a unique hexadecimal hash field in your solr response for each document.  You can have solr automatically do this for you using the `SignatureUpdateProcessorFactory`.

https://lucene.apache.org/solr/guide/8_4/update-request-processors.html

See the `updateRequestProcessorChain` used in this project's `solrconfig.xml` for an example.

### Configuration
This gem offers several configuration options that can be configured in a Rails initializer.

See [engine.rb](https://github.com/sul-dlss/blacklight_dynamic_sitemap/blob/master/lib/blacklight_dynamic_sitemap/engine.rb) for available configurations.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake ci` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sul-dlss/blacklight_dynamic_sitemap.
