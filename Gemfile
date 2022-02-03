source 'https://rubygems.org'
ruby '2.7.4'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',      '6.1.4.1'
gem 'puma',       '5.3.1'
gem 'sass-rails', '6.0.0'
gem 'webpacker',  '5.4.0'
gem 'turbolinks', '5.2.1'
gem 'jbuilder',   '2.10.0'
gem 'bootsnap',   '1.7.2', require: false
gem 'rails-controller-testing'

group :development, :test do
  gem 'sqlite3', '1.4.2'
  gem 'byebug',  '11.1.3', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',        '4.1.0'
  gem 'rack-mini-profiler', '2.3.1'
  gem 'listen',             '3.4.1'
  gem 'spring',             '2.1.1'
end

group :test do
  gem 'capybara',           '3.35.3'
  gem 'selenium-webdriver', '3.142.7'
  gem 'webdrivers',         '4.6.0'
  gem 'cuprite'
  gem 'minitest-rails', "~> 6.1.0"
end

# group :development, :test do
#   gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
#   gem 'capybara', '~> 3.32', '>= 3.32.2'
#   gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
# end

group :production do
  gem 'pg', '1.2.3'
end

gem 'simple_form'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'responders'
gem 'bootstrap'
gem 'jquery-rails', '~> 4.3'
gem 'turbolinks_render'


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# Uncomment the following line if you're running Rails
# on a native Windows system:
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]