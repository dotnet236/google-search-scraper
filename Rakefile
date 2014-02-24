require File.expand_path('./lib/google')
require File.expand_path('./config/application')

desc 'Search Google.com based on a specified term'
task :search, [:term] do |t, args|
  result = Google::Search.perform args[:term]

  query = Query.create term: result.term
  puts "Ad Results From Google Search Query '#{result.term}':"

  result.ads.each do |ad|
    Ad.create(
      link: ad.link,
      index: ad.index,
      description: ad.description
    )

    puts "  Ad Found ##{ad.index}"
    puts "     #{ad.link}"
    puts "     #{ad.description}"
  end

end

namespace :db do
  desc 'Create the dabatase based on schema.rb'
  task :setup do
    require File.expand_path('./db/schema.rb')
    ActiveRecord::Tasks::DatabaseTasks.create_all
  end
end

task default: 'search'
