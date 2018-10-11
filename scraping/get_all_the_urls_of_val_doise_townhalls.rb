require 'nokogiri'
require 'open-uri'
require 'pry'

def get_the_email_of_a_townhal_from_its_webpage(url)
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{url}"))
puts page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end 

def get_all_the_urls_of_val_doise_townhalls
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
news_links = page.css("a.lientxt")
news_links.each do |link|
  get_the_email_of_a_townhal_from_its_webpage(link['href'])
  puts "#{link.text}\t#{link['href']}"
end
end

get_all_the_urls_of_val_doise_townhalls
