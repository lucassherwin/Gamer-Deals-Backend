class Store < ApplicationRecord
  belongs_to :game

  def steam_scrape(steamID)
    store_url = "https://store.steampowered.com/app/#{steamID}"
    html = URI.open(store_url)
    doc = Nokogiri::HTML(html)
    price = doc.css('.game_purchase_price')[0].inner_text.strip
    price[0]= ''
    price = price.to_f

    self.name = 'Steam'
    self.price = price
    self.link = store_url
  end

  def gog_scrape(gogName)
    store_url = "https://www.gog.com/game/#{gogName}"
    html = URI.open(store_url)
    doc = Nokogiri::HTML(html)
    price = doc.css('.product-actions-price__final-amount')[0].inner_text.to_f

    self.name = 'GOG'
    self.price = price
    self.link = store_url
  end
end
