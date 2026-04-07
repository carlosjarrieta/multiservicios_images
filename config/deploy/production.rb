server '176.126.87.171', user: 'deploy', roles: %w[web app db], primary: true

set :branch, 'main'
set :stage, :production
set :rails_env, :production

set :service_unit_user, :user
set :systemctl_user, true
set :puma_systemctl_user, :user
