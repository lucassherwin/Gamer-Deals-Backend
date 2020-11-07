require 'nokogiri'
require 'open-uri'
require 'pry'

class SteamScraper
    def scrape_game(steamID)
        store_url = "https://store.steampowered.com/app/#{steamID}"
        html = URI.open(store_url)
        doc = Nokogiri::HTML(html)
        price = doc.css('.game_purchase_price')[0].inner_text.strip
        price[0]= ''
        price = price.to_f
    end
end

scrape = SteamScraper.new
scrape.scrape_game(1145360)
scrape.scrape_game(107100)