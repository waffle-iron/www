source 'https://rubygems.org'

gem 'rails', '~> 4.2.1'
gem 'comfortable_mexican_sofa', '~> 1.12'
gem 'will_paginate'
gem 'pg'

gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets

gem 'therubyracer', platforms: :ruby # See https://github.com/rails/execjs#readme for more supported runtimes
gem 'opal-rails', '0.8.0.rc1'
gem 'opal-jquery', github: 'opal/opal-jquery'

gem 'devise' # handle authenticaton, register , forgot password, etc

gem 'puma'

gem 'rollbar' # for error collecting
gem 'newrelic_rpm' # app peformance tracking
gem 'syslogger' # log to syslog

group :development do
  gem 'annotate', '~> 2.6', require: false
  gem 'capistrano', '~> 3.3', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false # Use Capistrano for deployment
end

group :development, :test do
  # gem 'byebug' # Call 'byebug' anywhere in the code to stop execution and get a debugger console

  gem 'spring', require: false # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-commands-testunit', require: false
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'shoulda-context'
  gem 'simplecov', require: false
  gem 'database_cleaner', require: false
end

