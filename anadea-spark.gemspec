# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'spark/version'
require 'date'

Gem::Specification.new do |s|
  s.required_ruby_version = ">= #{Spark::RUBY_VERSION}"
  s.authors = ['anadea']
  s.date = Date.today.strftime('%Y-%m-%d')

  s.description = <<-HERE
Spark is a base Rails project that you can upgrade. It is used by anadea
to get a jump start on a working app. Use Spark if you're in a rush
to build something amazing; don't use it if you like missing deadlines.
  HERE

  s.email = 'dmitriy.kiriyenko@anahoret.com'
  s.executables = ['spark']
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/Anadea/spark'
  s.license = 'MIT'
  s.name = 'anadea-spark'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.summary = "Generate a Rails app using Anadea's best practices."
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Spark::VERSION

  s.add_dependency 'bundler', '~> 1.3'
  s.add_dependency 'rails', Spark::RAILS_VERSION

  s.add_development_dependency 'rspec', '>= 3.2.0', '<4'
  s.add_development_dependency 'capybara', '~> 2.2', '>= 2.2.0'
end
