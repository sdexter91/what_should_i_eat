=begin require "what_should_i_eat/version."

require 'net/http'
require 'json'
 
module WhatShouldIEat
  def WhatShouldIEat.fresh
    result = Net::HTTP.get('www.edamam.com', '/search?type=Feeds')
    recipes = JSON.parse(result)
    name = recipes.first['items'].first['label']
    url = recipes.first['items'].first['url']
    puts name
    puts url
  end
end


require 'HTTParty'
result = HTTParty.get('https://www.edamam.com/search?type=Feeds')
result_string = result.to_s

require 'JSON'
 
hash = { ruby: "the best programming language ever" }
 
json = hash.to_json
 
puts json
 
json_course = "{\"course\":\"104\"}"
 
hash_course = JSON.parse(json_course)
 
puts json_course
 
puts hash_course

recipes = JSON.parse(result_string)

puts recipes
----
=end

require 'what_should_i_eat/printing'
require 'HTTParty'
require 'JSON'
 
module WhatShouldIEat
  def WhatShouldIEat.fresh
    result = HTTParty.get('https://www.edamam.com/search?type=Feeds')
    result_string = result.to_s
    recipes = JSON.parse(result_string)
    name = recipes.first['items'].first['label']
    url = recipes.first['items'].first['url']
    Printing.print name, url
  end
end