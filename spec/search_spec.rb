require 'open-uri'
require File.expand_path('./lib/google')
require File.expand_path('./config/application')

describe 'Google Search' do

  subject { Google::Search }

  before :all do
  end

  context '::Search#perform' do
    it 'should return all ads related to the specified search term' do
      OpenURI.stub(:open_uri).and_return File.read(File.expand_path('./spec/data/search_results.html'))

      result = Google::Search.perform 'Email Marketing'
      result.ads.count.should == 8
    end
  end
end
