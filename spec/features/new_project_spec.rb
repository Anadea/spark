require 'spec_helper'

RSpec.feature 'Build a new project with default configuration' do
  scenario 'specs pass', :smoke do
    run_generator

    Dir.chdir(project_path) do
      Bundler.with_clean_env do
        expect(`rake`).to include('0 failures')
      end
    end
  end

  scenario 'generated .ruby-version is pulled from gem .ruby-version' do
    run_generator

    ruby_version_file = IO.read("#{project_path}/.ruby-version")

    expect(ruby_version_file).to eq "#{RUBY_VERSION}\n"
  end

  scenario 'secrets.yml reads secret from env' do
    run_generator

    secrets_file = IO.read("#{project_path}/config/secrets.yml")

    expect(secrets_file).to match(/secret_key_base: <%= ENV\["SECRET_KEY_BASE"\] %>/)
  end

  scenario 'action mailer support file is added' do
    run_generator

    expect(File).to exist("#{project_path}/spec/support/action_mailer.rb")
  end

  scenario "i18n support file is added" do
    run_generator

    expect(File).to exist("#{project_path}/spec/support/i18n.rb")
  end

  scenario 'newrelic.yml reads NewRelic license from env' do
    run_generator

    newrelic_file = IO.read("#{project_path}/config/newrelic.yml")

    expect(newrelic_file).to match(
      /license_key: "<%= ENV\["NEW_RELIC_LICENSE_KEY"\] %>"/
    )
  end

  scenario 'records pageviews through Google Analytics if ENV variable set' do
    run_generator

    expect(analytics_partial).
      to include(%{- if ENV.key?("GOOGLE_ANALYTICS_KEY")})
    expect(analytics_partial).
      to include(%{_gaq.push(['_setAccount', '\#{ENV["GOOGLE_ANALYTICS_KEY"]}']);})
  end

  scenario "raises on unpermitted parameters in all environments" do
    run_generator

    result = IO.read("#{project_path}/config/application.rb")

    expect(result).to match(
      /^ +config.action_controller.action_on_unpermitted_parameters = :raise$/
    )
  end

  scenario "raises on missing translations in development and test" do
    run_generator

    %w[development test].each do |environment|
      environment_file =
        IO.read("#{project_path}/config/environments/#{environment}.rb")
      expect(environment_file).to match(
        /^ +config.action_view.raise_on_missing_translations = true$/
      )
    end
  end

  scenario "specs for missing or unused translations" do
    run_generator

    expect(File).to exist("#{project_path}/spec/i18n_spec.rb")
  end

  scenario "config file for i18n tasks" do
    run_generator

    expect(File).to exist("#{project_path}/config/i18n-tasks.yml")
  end

  scenario "generated en.yml is evaluated" do
    run_generator

    locales_en_file = IO.read("#{project_path}/config/locales/en.yml")
    app_name = TestHelpers::APP_NAME

    expect(locales_en_file).to match(/application: #{app_name.humanize}/)
  end

  scenario "config simple_form" do
    run_generator

    expect(File).to exist("#{project_path}/config/initializers/simple_form.rb")
  end

  scenario "config :smtp email delivery method for development" do
    run_generator

    dev_env_file = IO.read("#{project_path}/config/environments/development.rb")
    expect(dev_env_file).
      to match(/^ +config.action_mailer.delivery_method = :smtp$/)
  end

  scenario "config active job queue adapter" do
    run_generator

    application_config = IO.read("#{project_path}/config/application.rb")
    test_config = IO.read("#{project_path}/config/environments/test.rb")

    expect(application_config).to match(
      /^ +config.active_job.queue_adapter = :delayed_job$/
    )
    expect(test_config).to match(
      /^ +config.active_job.queue_adapter = :inline$/
    )
  end

  def analytics_partial
    IO.read("#{project_path}/app/views/application/_analytics.html.haml")
  end
end
