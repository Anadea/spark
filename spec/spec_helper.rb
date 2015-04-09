require 'capybara/rspec'
require 'bundler/setup'

Bundler.require(:default, :test)

require (Pathname.new(__FILE__).dirname + '../lib/spark').expand_path

Dir['./spec/support/**/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.include TestHelpers

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random
  Kernel.srand config.seed

  config.before(:all) do
    drop_dummy_database
    recreate_tmp_directory
  end

  config.before(:each) do
    drop_dummy_database
    remove_project_directory
  end

end
