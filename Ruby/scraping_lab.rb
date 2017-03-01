require 'nokogiri'
require 'open-uri'

def wiki_scraper(animal_name)
  # animal = Animal.new
  url = "https://en.wikipedia.org/wiki/#{animal_name.capitalize}"
  # puts url
  html = Nokogiri::HTML(open(url))
  animal_info = {}
  num = 5
  until num >= 13
    animal_info[html.css(".infobox tr")[num].text.split(":")[0].strip] = html.css(".infobox tr")[num].text.split(":")[1].strip
    num += 1
  end
  animal_info
end

class Animal

  attr_accessor :kingdom, :phylum, :clade, :klass, :order, :family, :subfamily, :genus

  def self.new_from_wiki(animal_name) 
    Animal.new.tap do |animal|
    # tap method automatically creates a new "Animal" variable ("animal") and returns this variable at the end of the method without having to call the "animal" variable at the end
      properties = wiki_scraper(animal_name)
      properties.each do |key, value|
        if key != "Class"
          animal.send("#{key.downcase}=", value)
          # Send method is used fo "Mass Assignment" which means to set many variables at once using a collection
        else
          animal.klass = value
        end
      end
    end
    # animal 
    # (unnecessary due to "tap" method)
  end

end
  


wiki_scraper("hippopotamus").each do |key, value|
  puts "#{key}: #{value}"
end

puts Animal::new_from_wiki("hippopotamus").inspect

