source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'
gem 'activesupport'
gem 'autoprefixer-rails'
gem 'delayed_job_active_record'
gem 'flutie'
gem 'jquery-rails'
gem 'slim-rails'
# gem 'pg'
gem 'normalize-rails'
gem 'puma'
gem 'rack-canonical-host'
gem 'rails', '~> 5.1.2'
gem 'recipient_interceptor'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'sqlite3'

gem 'sprockets', '>= 3.0.0'

gem 'title'
gem 'uglifier'

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bundler-audit', '>= 0.5.0', require: false
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.6'
end

group :development, :staging do
  gem 'rack-mini-profiler', require: false
end

group :test do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rack-timeout'
end

gem 'bourbon', '~> 5.0.0.beta.8'
gem 'high_voltage'
gem 'neat', '~> 2.1'
gem 'refills', group: %i[development test]
