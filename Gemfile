source 'https://rubygems.org'


gem 'rails', '4.1.1'
gem 'mysql2'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'unicorn'

gem 'bootstrap-sass'
gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.0'

gem 'rails_config'
gem 'kaminari'
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.1'
gem 'draper'

# Upload and image processing
gem 'paperclip', '~> 4.1'
gem 'rmagick'
gem 'mini_magick'

# authentication
gem 'cancancan'

# solr
gem 'sunspot_rails'
gem 'sunspot_solr'
gem 'progress_bar'


group :development, :test do
  # gem 'debugger'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'hirb'
  gem 'hirb-unicode'

  gem 'tapp'
  gem 'awesome_print'
  gem 'quiet_assets'
  gem 'annotate', git: 'git://github.com/ctran/annotate_models.git'
  gem 'timecop'
  gem 'database_rewinder'

  # capistrano
  gem 'capistrano', :require => false
  gem 'capistrano-rails', :require => false
  gem 'capistrano-rbenv', :require => false
  gem 'capistrano-bundler', :require => false
  gem 'capistrano3-unicorn'
end

group :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'faker'
  gem 'autodoc'
end