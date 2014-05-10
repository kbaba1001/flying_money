source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '~> 4.1.0'

gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
gem 'draper', '~> 1.3'
gem 'foundation-rails'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'validates_email_format_of'

group :development do
  gem 'awesome_print', group: :test
  gem 'bullet'
  gem 'dotenv-rails', groups: :test
  gem 'metric_fu', require: false
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
  gem 'poltergeist', require: false
  gem 'rspec-html-matchers'
  gem 'rspec-rails', group: :development
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
