require 'open-uri'
require File.expand_path('./lib/search_scraper')
require File.expand_path('./config/application')

describe 'SearchScraper' do

  subject { SearchScraper }

  before :all do
  end

  let(:total_ad_count) { 8 }
  let(:search_term) { 'Email Marketing' }

  context '#scrape' do
    it 'should persist all ads related to the specified search term' do
      Ad.should_receive(:create).exactly(total_ad_count).times

      OpenURI.stub(:open_uri).and_return File.read(File.expand_path('./spec/data/search_results.html'))
      SearchScraper.scrape_ads search_term
    end
  end
end
