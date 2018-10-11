require 'pry'
require 'nokogiri'
require 'open-uri'

def get_emails(urls)
  final_array = []
  i = 0
  urls.each do |url|
    hash = {}
    webpage = Nokogiri::HTML(open("https://www.nosdeputes.fr#{url}"))
    hash['first_name'] = webpage.xpath('//*[@id="corps_page"]/div/div[1]/div[1]/h1').text.split(" ")[0]
    hash['last_name'] = webpage.xpath('//*[@id="corps_page"]/div/div[1]/div[1]/h1').text.split(" ")[1]
    begin
      hash['email'] = webpage.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li/a')[0].text
    rescue
      hash['email'] = "Non renseigné"
    end
    final_array << hash
    puts i
    i += 1
  end
  final_array
end

def get_deputies
  array = []
  webpage = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
  webpage.css('td>a').each do |inner|
    array << inner['href']
  end
  p get_emails(array)
end

get_deputies
