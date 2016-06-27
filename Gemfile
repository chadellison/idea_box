source 'https://rubygems.org'

# gem 'responders'
# gem 'active_model_serializers', github: 'rails-api/active_model_serializers'

ruby '2.3.0'
gem 'rails', '4.2.6'
gem 'pg'

gem 'sass-rails', '~> 5.0'

gem 'figaro'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'unicorn'
gem 'bcrypt', '~> 3.1.7'
gem 'faraday'
gem 'aws-sdk-v1'

group :development, :test do
  gem 'vcr'
  gem 'webmock'
  # gem 'selenium-webdriver' < -- for ajax
  gem 'byebug'
  gem 'capybara'
  gem 'launchy'
  gem 'capybara-webkit'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem 'mocha'
  gem 'simplecov', :require => false
end

group :development do
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
end

group :production do
  gem 'rails_12factor'
end
