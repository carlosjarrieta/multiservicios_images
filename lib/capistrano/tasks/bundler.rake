namespace :bundler do
  desc 'Install specific bundler version'
  task :install_version do
    on roles(:app) do
      execute "~/.rvm/bin/rvm #{fetch(:rvm_ruby_version)} do gem install bundler -v 2.3.7"
    end
  end
end

before 'bundler:config', 'bundler:install_version'
