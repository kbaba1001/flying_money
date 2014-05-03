source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '~> 4.1.0'

gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'awesome_print', group: :test
  gem 'bullet'
  gem 'dotenv-rails', groups: :test
  gem 'metric_fu'
  gem 'pry-byebug', group: :test
  gem 'pry-rails', group: :test
  gem 'spring'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails', group: :development
  gem 'fuubar'
  gem 'launchy'
  gem 'rspec-rails', group: :development
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
