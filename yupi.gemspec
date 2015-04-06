# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'yupi/version'
require 'date'

Gem::Specification.new do |s|
  s.required_ruby_version = ">= #{Yupi::RUBY_VERSION}"
  s.authors = ['anadea']
  s.date = Date.today.strftime('%Y-%m-%d')

  s.description = <<-HERE
Yupi is a base Rails project that you can upgrade. It is used by anadea
to get a jump start on a working app. Use Yupi if you're in a rush
to build something amazing; don't use it if you like missing deadlines.
  HERE

  s.email = 'dmitriy.kiriyenko@anahoret.com'
  s.executables = ['yupi']
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/Anadea/yupi'
  s.license = 'MIT'
  s.name = 'yupi'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.summary = "Generate a Rails app using Anadea's best practices."
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Yupi::VERSION

  s.add_dependency 'bundler', '~> 1.3'
  s.add_dependency 'rails', Yupi::RAILS_VERSION

  s.add_development_dependency 'rspec', '>= 3.2.0', '<4'
  s.add_development_dependency 'capybara', '~> 2.2', '>= 2.2.0'
end
