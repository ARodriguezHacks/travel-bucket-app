source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2', '>= 5.2.2.1'

gem 'puma', '>= 3.12.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'bootstrap', '~> 4.4', '>= 4.4.1'
gem 'bcrypt'
gem 'figaro', '1.0'
gem 'faker'
gem "actionview", ">= 5.2.2.1"
gem 'popper_js', '~> 1.14.5'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'font-awesome-sass', '~> 5.8.1'
gem "loofah", ">= 2.3.1"

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3', '~> 1.3.6'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing'
  gem 'shoulda'
  gem 'factory_bot_rails'
end