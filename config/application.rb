require File.expand_path './config/db_connection.rb'

Dir.entries( File.expand_path('./app/models'))[2..-1].each do |file|
  path = File.expand_path("./app/models/#{file}")
  require path if File.exists? path
end
