source 'https://rubygems.org'

gem 'rails',        '5.0.0.1'
gem 'bootstrap-sass', '3.3.6'
gem 'puma',         '3.4.0'
gem 'sass-rails',   '5.0.6'
gem 'uglifier',     '3.0.0'
gem 'coffee-rails', '4.2.1'
gem 'jquery-rails', '4.1.1'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.4.1'
gem 'devise',       '4.2.0'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'font-awesome-rails'
gem 'carrierwave',  '~> 1.0'
gem 'mini_magick'
gem 'acts-as-taggable-on', '~> 4.0'

group :development, :test do
  gem 'rspec-rails',           '~> 3.5.0'
  gem 'factory_girl_rails',    '~> 4.7.0'
  gem 'guard-rspec',           '~> 4.7.2'
  gem 'spring-commands-rspec', '~> 1.0.2'
  gem 'sqlite3',               '1.3.11'
  gem 'byebug',                '9.0.0', platform: :mri
end

group :development do
  gem 'web-console',           '3.1.1'
  gem 'listen',                '3.0.8'
  gem 'spring',                '1.7.2'
  gem 'spring-watcher-listen', '2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem "faker",                    '~> 1.4.3'
  gem "capybara",                 '~> 2.7.1'
  gem "database_cleaner",         '~> 1.5.3'
  gem "launchy",                  '~> 2.4.2'
  gem "selenium-webdriver",       '~> 2.43.0'
  gem 'rails-controller-testing', '0.1.1'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]