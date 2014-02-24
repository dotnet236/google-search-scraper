require 'nokogiri'
require 'open-uri'

module Google
  class Search
    GOOGLE_SEARCH_URL = "http://www.google.com/search?q="

    def self.perform(term)
      doc = Nokogiri::HTML(open("#{GOOGLE_SEARCH_URL}#{URI.escape(term)}"))

      index = 1
      query = Query.new term

      doc.css('table table li').each do |li|
        link = li.css('a')[0]
        text = li.css('> span')[0]

        next if not link or not text

        ad = Ad.new index, parse_ad_url(link['href'])[:external], text.inner_html
        query.ads << ad
      end

      query
    end

  private

    def self.parse_ad_url(url)
      split_url = URI.decode(url).split 'adurl='
      { google: split_url[0], external: split_url.count > 1 ? split_url[1] : nil }
    end
  end

  class Ad
    attr_accessor :index, :link, :description

    def initialize(index, link, description)
      @index = index
      @link = link
      @description = description
    end
  end

  class Query
    attr_accessor :term, :ads

    def initialize(term)
      @term = term
      @ads = []
    end
  end
end
