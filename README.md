# Yupi [![Build Status](https://secure.travis-ci.org/Anadea/yupi.svg?branch=master)](http://travis-ci.org/Anadea/yupi)

Yupi is the base Rails application used at
[anadea](http://anadea.info).

  ![Yupi juice](http://www.dismarex.com.ec/pro/img/YUPI.jpg)

## Installation

First install the yupi gem:

    gem install yupi

Then run:

    yupi projectname

This will create a Rails app in `projectname` using the latest version of Rails.

## Customizations

Application gems:

* [Bootstrap](https://github.com/twbs/bootstrap-sass) attached
  and layout configured.
* [Coffee Rails](https://github.com/rails/coffee-rails) as a Rails default.
* [Email Validator](https://github.com/balexand/email_validator) for email
  validation.
* [Figaro](https://github.com/laserlemon/figaro) for application configuration.
* [Haml Rails](https://github.com/indirect/haml-rails) for templates.
* [High Voltage](https://github.com/thoughtbot/high_voltage) for static pages.
* [Jquery Rails](https://github.com/rails/jquery-rails) for JQuery as a Rails
  default.
* [New Relic RPM](https://github.com/newrelic/rpm) for monitoring performance.
* [Postgres](https://github.com/ged/ruby-pg) for access to Postgresql database.
* [Puma](https://github.com/puma/puma) as an application server for both
  development and production.
* [Rack Timeout](https://github.com/heroku/rack-timeout) to abort requests that
  take too long.
* [Recipient Interceptor](https://github.com/croaky/recipient_interceptor) to
  avoid accidentally sending emails to real people from staging.
* [Sass Rails](https://github.com/rails/sass-rails) as a Rails default.
* [Simple Form](https://github.com/plataformatec/simple_form) for form markup
  and style – initialized for bootstrap.
* [Title](https://github.com/calebthompson/title) for storing titles in
  translations.
* [Uglifier](https://github.com/lautis/uglifier) as a Rails default.

Development gems:

* [Bundler Audit](https://github.com/rubysec/bundler-audit) for scanning the
  Gemfile for insecure dependencies based on published CVEs.
* [ByeBug](https://github.com/deivid-rodriguez/byebug) for interactively
  debugging behavior
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring
  objects
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading
* [Spring Commands Rspec](https://github.com/jonleighton/spring-commands-rspec)
  for springifying `bin/rspec` command (already initialized).
* [Web Console](https://github.com/rails/web-console) for better debugging via
  in-browser IRB consoles.  

Testing gems:

* [Capybara](https://github.com/jnicklas/capybara) and
  [Poltergeist](https://github.com/teampoltergeist/poltergeist) for
  integration testing.
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data.
* [Formulaic](https://github.com/thoughtbot/formulaic) for integration testing
  HTML forms.
* [RSpec](https://github.com/rspec/rspec) for unit testing.
* [RSpec Mocks](https://github.com/rspec/rspec-mocks) for stubbing and spying.
* [SimpleCov](https://github.com/colszowka/simplecov) for code coverage.
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) for common
  RSpec matchers.
* [Timecop](https://github.com/jtrupiano/timecop-console) for testing time.
* [Webmock](https://github.com/bblimke/webmock) for testing external requests.

Tweaks and goodies:

* The [`./bin/setup`][setup] convention for new developer setup.
* Application layout set up for twitter bootstrap.
* A few nice time formats set up for localization.
* `Rack::Deflater` to [compress responses with Gzip][compress].
* A [low database connection pool limit][pool].
* `t()` and `l()` in specs without prefixing with I18n.
* An automatically-created `SECRET_KEY_BASE` environment variable in all
  environments
* Google analytics set up and waiting for key.
* [Rails 12 factor][rails12factor] to deploy on Heroku
  and similar.
* `Procfile` for both development and deploy to Heroku and similar.
* Configure email delivery to mailcatcher in development, install and launch
  [Mailcatcher][mailcatcher].
* Raise on unpermitted parameters in all environments.
* Raise on missing translations in development and test.
* Add `.ruby-version` for Rbenv and other Ruby version managers.
* Remove comment blocks from `config/routes.rb`.

[setup]: http://robots.thoughtbot.com/bin-setup
[compress]: http://robots.thoughtbot.com/content-compression-with-rack-deflater/
[pool]: https://devcenter.heroku.com/articles/concurrency-and-database-connections
[rails12factor]: https://github.com/heroku/rails_12factor
[mailcatcher]: http://mailcatcher.me/

## Dependencies

Yupi requires the latest version of Ruby.

Some gems included in Yupi have native extensions. You should have GCC
installed on your machine before generating an app with Yupi.

Use [OS X GCC Installer](https://github.com/kennethreitz/osx-gcc-installer/) for
Snow Leopard (OS X 10.6).

Use [Command Line Tools for XCode](https://developer.apple.com/downloads/index.action)
for Lion (OS X 10.7) or Mountain Lion (OS X 10.8).

We use [Poltergeist](https://github.com/teampoltergeist/poltergeist) for
full-stack JavaScript integration testing. It requires PhantomJS. Instructions for
installing it are
[here](https://github.com/teampoltergeist/poltergeist#installing-phantomjs).

PostgreSQL needs to be installed and running for the `db:create` rake task.

## Issues

If you have problems, please create a
[GitHub Issue](https://github.com/Anadea/yupi/issues).

## License

Yupi is Copyright © 2008-2015 Anadea.
It is free software,
and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: LICENSE

## Thanks

To [suspenders](https://github.com/thoughtbot/suspenders).

## About Anadea

![anadea](https://avatars2.githubusercontent.com/u/4539766?v=3&s=200)

Yupi is maintained and funded by Anadea, inc.
The names and logos for Anadea are trademarks of Anadea, inc.

We are [available for hire][hire].

[hire]: https://anadea.info/en?utm_source=github
