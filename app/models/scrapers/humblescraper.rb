require 'nokogiri'
require 'open-uri'
require 'pry'

class HumbleScraper
    def scrape_game(humbleName)
        store_url = "https://www.humblebundle.com/store/#{humbleName}"
        html = URI.open(store_url)
        doc = Nokogiri::HTML(html)
        price = doc.css('.current-price')
        binding.pry
        puts price
    end
end

scrape = HumbleScraper.new
scrape.scrape_game('among-us')
# scrape.scrape_game('cyberpunk_2077')