require 'nokogiri'
require 'open-uri'
require 'pry'

class GogScraper
    def scrape_game(gogName)
        store_url = "https://www.gog.com/game/#{gogName}"
        html = URI.open(store_url)
        doc = Nokogiri::HTML(html)
        price = doc.css('.product-actions-price__final-amount')[0].inner_text.to_f
        puts price
    end
end

scrape = GogScraper.new
scrape.scrape_game('bastion')
scrape.scrape_game('cyberpunk_2077')