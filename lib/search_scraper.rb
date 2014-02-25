require File.expand_path('./lib/google/search')
require File.expand_path('./config/application')

class SearchScraper
  def self.scrape_ads(term)
    result = Google::Search.perform term

    Query.create term: result.term
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
end
