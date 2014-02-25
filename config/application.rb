require File.expand_path './config/db_connection.rb'

Dir.entries(File.expand_path('./app/models')).each do |file|
  path = File.expand_path("./app/models/#{file}")
  unless file.to_s.empty? || Dir.exists?(path) || !File.exists?(path)
    require path
  end
end
