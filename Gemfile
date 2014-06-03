source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '~> 4.1.0'

gem 'action_args'
gem 'chartkick'
gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
gem 'draper', '~> 1.3'
gem 'font-awesome-rails'
gem 'foundation-rails'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg'
gem 'rails_admin'
gem 'rails_admin-i18n'
gem 'sass-rails', '~> 4.0.3'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'validates_email_format_of'

group :development do
  gem 'bullet'
  gem 'metric_fu', require: false
  gem 'quiet_assets'
  gem 'spring'

  group :test do
    gem 'awesome_print'
    gem 'dotenv-rails'
    gem 'pry-byebug'
    gem 'pry-rails'
  end
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'launchy'
  gem 'poltergeist', require: false
  gem 'rspec-html-matchers'
  gem 'simplecov', require: false

  group :development do
    gem 'factory_girl_rails'
    gem 'faker'
    gem 'rspec-rails'
  end
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
