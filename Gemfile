source 'https://rubygems.org'

gem 'sinatra',         require: 'sinatra/base'
gem 'sinatra-contrib', require: 'sinatra/reloader'
gem 'haml',            require: 'haml'
gem 'twilio-ruby',     require: 'twilio-ruby'

gem 'slim'
group :development do
  gem 'unicorn'
  gem 'guard'
  gem 'listen'
  gem 'rb-inotify',    :require => false
  gem 'rb-fsevent',    :require => false
  gem 'guard-unicorn'
end
group :test do
  gem 'rack-test'
  gem 'rspec'
end
