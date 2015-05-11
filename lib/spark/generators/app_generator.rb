require 'ostruct'
require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Spark
  class AppGenerator < Rails::Generators::AppGenerator
    class_option :database, type: :string, aliases: "-d", default: "postgresql",
      desc: "Configure for selected database (options: #{DATABASES.join("/")})"

    class_option :skip_test_unit, type: :boolean, aliases: "-T", default: true,
      desc: "Skip Test::Unit files"

    class_option :skip_turbolinks, type: :boolean, default: true,
      desc: "Skip turbolinks gem"

    class_option :skip_bundle, type: :boolean, aliases: "-B", default: true,
      desc: "Don't run bundle install"

    def finish_template
      invoke :spark_customization
      super
      invoke :run_bin_setup
    end

    def spark_customization
      invoke :customize_gemfile
      invoke :setup_secret_token
      invoke :create_spark_views
      invoke :configure_app
      invoke :remove_routes_comment_lines
      invoke :add_root_route
      invoke :setup_development_environment
      invoke :setup_test_environment
      invoke :setup_production_environment
      invoke :setup_assets
      invoke :copy_miscellaneous_files
      invoke :customize_error_pages
      invoke :setup_git
      invoke :setup_database
      invoke :setup_bundler_audit
      invoke :outro
    end

    def customize_gemfile
      build :replace_gemfile
      build :set_ruby_to_version_being_used

      bundle_command 'install'
    end

    def setup_database
      say 'Setting up database'

      if 'postgresql' == options[:database]
        build :use_postgres_config_template
      end

      build :create_database
    end

    def setup_development_environment
      say 'Setting up the development environment'
      build :raise_on_delivery_errors
      build :set_test_delivery_method
      build :raise_on_unpermitted_parameters
      build :provide_setup_script
      build :provide_dev_prime_task
      build :configure_generators
      build :configure_i18n_for_missing_translations
    end

    def setup_test_environment
      say 'Setting up the test environment'
      build :set_up_factory_girl_for_rspec
      build :generate_rspec
      build :configure_rspec
      build :configure_background_jobs_for_rspec
      build :enable_database_cleaner
      build :configure_spec_support_features
      build :configure_action_mailer_in_specs
      build :configure_jasmine_rails
      build :add_jasmine_spec_sample
    end

    def setup_production_environment
      say 'Setting up the production environment'
      build :configure_exception_notification
      build :configure_smtp
      build :setup_asset_host
    end

    def setup_staging_environment
      say 'Setting up the staging environment'
      build :setup_staging_environment
    end

    def setup_secret_token
      say 'Moving secret token out of version control'
      build :setup_secret_token
    end

    def create_spark_views
      say 'Creating spark views'
      build :create_partials
      build :create_application_layout
      build :create_home_page
    end

    def configure_app
      say 'Configuring app'
      build :setup_figaro
      build :configure_action_mailer
      build :configure_active_job
      build :configure_time_formats
      build :configure_simple_form
      build :disable_xml_params
      build :fix_i18n_deprecation_warning
      build :configure_locales_load_from_folders
      build :setup_default_rake_task
      build :setup_foreman
    end

    def setup_assets
      say 'Set up assets'
      build :setup_stylesheets
      build :setup_javascripts
    end

    def setup_git
      if !options[:skip_git]
        say 'Initializing git'
        invoke :setup_gitignore
        invoke :init_git
      end
    end

    def create_heroku_apps
      if options[:heroku]
        say "Creating Heroku apps"
        build :create_heroku_apps, options[:heroku_flags]
        build :set_heroku_serve_static_files
        build :set_heroku_remotes
        build :set_heroku_rails_secrets
        build :provide_deploy_script
      end
    end

    def setup_gitignore
      build :gitignore_files
    end

    def setup_bundler_audit
      say "Setting up bundler-audit"
      build :setup_bundler_audit
    end

    def init_git
      build :init_git
    end

    def copy_miscellaneous_files
      say 'Copying miscellaneous support files'
      build :copy_miscellaneous_files
    end

    def customize_error_pages
      say 'Customizing the 500/404/422 pages'
      build :customize_error_pages
    end

    def remove_routes_comment_lines
      build :remove_routes_comment_lines
    end

    def add_root_route
      build :add_root_route
    end

    def run_bin_setup
      build :run_bin_setup
    end

    def outro
      say 'Congratulations! Now start creating a great app.'
    end

    protected

    def db_host
      db_info.host
    end

    def db_port
      db_info.port
    end

    def db_username
      db_info.user
    end

    def db_password
      db_info.password
    end

    def db_info
      if ENV.key?("GENERATED_DATABASE_URL")
        URI.parse(ENV["GENERATED_DATABASE_URL"])
      else
        OpenStruct.new
      end
    end

    def get_builder_class
      Spark::AppBuilder
    end

    def using_active_record?
      !options[:skip_active_record]
    end
  end
end
