ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

#ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)
set :database_file, "./database.yml"
require_all 'app'
