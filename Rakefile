require 'rspec/core/rake_task'
require File.expand_path('./lib/search_scraper')
require File.expand_path('./config/application')

namespace :google do
  namespace :scrape do
    desc 'Search & persist ads returned from a Google search'
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

namespace :spec do
  desc 'Run all the specs'
  RSpec::Core::RakeTask.new(:all) do |t|
    t.pattern = [ "./spec/*_spec.rb" ]
    t.rspec_opts = '--format h --out rspec_reports/functional.html --format doc'
  end
end

task default: 'search'
