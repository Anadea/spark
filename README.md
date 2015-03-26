# NOT READY YET!!!

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

## Gemfile

To see the latest and greatest gems, look at Yupi'
[Gemfile](templates/Gemfile.erb), which will be appended to the default
generated projectname/Gemfile.

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
