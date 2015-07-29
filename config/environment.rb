require 'bundler'
Bundler.require

require './app/models/user'
require './app/models/pref'

configure :development do
  set :database, "sqlite3:db/database.db"
end