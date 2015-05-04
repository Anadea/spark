module TestHelpers
  APP_NAME = "dummy_app"

  def remove_project_directory
    FileUtils.rm_rf(project_path)
  end

  def recreate_tmp_directory
    FileUtils.rm_rf(project_path)
    FileUtils.mkdir_p(tmp_path)
  end

  def run_generator(arguments = nil)
    Dir.chdir(tmp_path) do
      Bundler.with_clean_env do
        ENV['TESTING'] = '1'

        %x(#{generator_bin} #{APP_NAME} #{arguments})
        fail 'Application generation failed' unless $?.exitstatus == 0
      end
    end
  end

  def drop_dummy_database
    if File.exist?(project_path)
      Dir.chdir(project_path) do
        Bundler.with_clean_env do
          %x(rake db:drop)
        end
      end
    end
  end

  def project_path
    @project_path ||= Pathname.new("#{tmp_path}/#{APP_NAME}")
  end

  private

  def tmp_path
    @tmp_path ||= Pathname.new("#{root_path}/tmp")
  end

  def generator_bin
    File.join(root_path, 'bin', 'spark')
  end

  def root_path
    File.expand_path('../../../', __FILE__)
  end
end
