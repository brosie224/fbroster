ENV['SINATRA_ENV'] ||= "development"
ENV['SINATRA_ACTIVESUPPORT_WARNING'] = 'false'

require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
  
  require_all 'app'