role :app, %w{apluser@54.92.86.76}
role :web, %w{apluser@54.92.86.76}
role :db, %w{apluser@54.92.86.76}

set :stage, :production
set :branch, 'master'
set :rails_env, 'production'
set :unicorn_rack_env, 'production'

server '54.92.86.76', user: 'apluser', roles: %w{web app db}, my_property: :my_value

set :ssh_options, {
    keys: %w(~/Documents/hcpj/aws/hcpj.pem),
    forward_agent: false
}
