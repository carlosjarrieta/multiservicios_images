namespace :debug_server do
  desc 'Check ruby versions in both rvm locations'
  task :check_rubies do
    on roles(:app) do
      execute "/usr/local/rvm/bin/rvm list" rescue nil
      execute "/usr/local/rvm/bin/rvm list" rescue nil
      execute "/usr/local/rvm/bin/rvm 2.7.8 do ruby -v" rescue nil
      execute "/usr/local/rvm/bin/rvm 2.7.8 do ruby -v" rescue nil
    end
  end
end
