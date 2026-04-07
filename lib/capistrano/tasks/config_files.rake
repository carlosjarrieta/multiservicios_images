namespace :config_files do
  desc 'Upload config files to shared path'
  task :upload do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      upload! StringIO.new(File.read('config/master.key')), "#{shared_path}/config/master.key"
      upload! StringIO.new(File.read('config/database.yml')), "#{shared_path}/config/database.yml"
    end
  end
end
