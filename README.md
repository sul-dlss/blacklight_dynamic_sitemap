# BlacklightDynamicSitemap

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/blacklight_dynamic_sitemap`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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
This feature relies on a unique hexidecimal hash field in your solr response for each document.  You can have solr automatically do this for you using the `SignatureUpdateProcessorFactory`.

https://lucene.apache.org/solr/guide/8_4/update-request-processors.html

See the `updateRequestProcessorChain` used in this project's `solrconfig.xml` for an example.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/blacklight_dynamic_sitemap.
