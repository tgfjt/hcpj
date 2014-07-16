role :app, %w{apluser@54.92.86.76}
role :web, %w{apluser@54.92.86.76}
role :db, %w{apluser@54.92.86.76}

set :stage, :staging
set :branch, 'develop'
set :rails_env, 'staging'
set :unicorn_rack_env, 'staging'

server '54.92.86.76', user: 'apluser', roles: %w{web app db}, my_property: :my_value

set :ssh_options, {
    keys: %w(~/Documents/hcpj/aws/hcpj.pem),
    forward_agent: false
}
