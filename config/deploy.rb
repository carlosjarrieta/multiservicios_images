# config valid for current version and patch releases of Capistrano
lock "~> 3.13.0"

set :application, "caimages"
set :scm, :git
set :repo_url, "ssh://git@bitbucket.org:22/carlosjarrieta/api_images.git"
set :branch, "master"
set :deploy_via, :copy
set :user, "deploy"
set :rvm_ruby_version, "2.7.8"

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/home/deploy/www/caimages"
set :linked_files, %w{config/database.yml config/master.key}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads node_modules}

set :keep_releases, 5

set :puma_threads,    [4, 16]
set :puma_workers,    0
set :assets_roles, [] #Only for apis

set :pty,             true
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_ed25519) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, false  # Change to false when not using ActiveRecord


before 'deploy:starting', 'config_files:upload'