require 'open-uri'
require File.expand_path('./lib/google/search')
require File.expand_path('./config/application')

describe 'Google::Search' do

  subject { Google::Search }

  before :all do
    OpenURI.stub(:open_uri).and_return File.read(File.expand_path('./spec/data/search_results.html'))
  end

  let(:total_ad_count) { 8 }
  let(:search_term) { 'Email Marketing' }

  context '#perform' do
    it 'should return all Google ads related to the specified search term' do
      result = Google::Search.perform 'Email Marketing'
      result.ads.count.should == 8
    end
  end
end
