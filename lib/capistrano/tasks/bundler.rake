namespace :bundler do
  desc 'Install specific bundler version'
  task :install_version do
    on roles(:app) do
      execute "/usr/local/rvm/bin/rvm #{fetch(:rvm_ruby_version)} do gem install bundler"
    end
  end
end

before 'bundler:config', 'bundler:install_version'
