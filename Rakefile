require File.expand_path('./lib/search_scraper')
require File.expand_path('./config/application')

desc 'Search & persist ads returned from a Google search'
namespace :google do
  namespace :scrape do
    task :ads, [:term] do |t, args|
      SearchScraper.scrape_ads args[:term]
    end
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
