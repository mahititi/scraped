require 'nokogiri'
require 'open-uri'
require 'pry'

def get_the_email_of_a_townhal_from_its_webpage(url)
page = Nokogiri::HTML(open(url))
puts page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end
