# config valid for current version and patch releases of Capistrano
lock "~> 3.18"

set :application, "caimages"
set :scm, :git
set :repo_url, "git@github.com:carlosjarrieta/multiservicios_images.git"
set :branch, "main"
set :user, "deploy"

# RVM configuration
set :rvm_ruby_version, "3.2.2"

set :default_env, {
  'NODE_OPTIONS' => '--openssl-legacy-provider',
  'NVM_DIR' => '/home/deploy/.nvm',
  'PATH' => "/home/deploy/.nvm/versions/node/v20.19.5/bin:$PATH",
  'COREPACK_ENABLE_DOWNLOAD_PROMPT' => '0'
}

# Node and yarn
set :nvm_type, :user
set :nvm_node, 'v20.19.5'
set :nvm_map_bins, %w{node npm yarn}
set :yarn_flags, []

# Deploy configuration
set :deploy_to, "/home/deploy/www/caimages"
set :deploy_via, :remote_cache
set :linked_files, %w{config/database.yml config/master.key}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads node_modules}
set :keep_releases, 5

# Puma configuration
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

# Nginx configuration
set :nginx_server_name, "images.cadeveloper.com"
set :nginx_config_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :nginx_flags, 'fail_timeout=0'
set :nginx_http_flags, 'proxy_connect_timeout 600; proxy_read_timeout 600; proxy_send_timeout 600'

# Only for apis (no assets)
set :assets_roles, []

# SSH configuration
set :pty, true
set :use_sudo, false
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_ed25519) }

