require 'mechanize'
require 'open-uri'

# Return Array of Elasticsearch cluster name
def elasticsearch_clusters
  cluster_names = open('https://raw.githubusercontent.com/elastic/elasticsearch/master/core/src/main/resources/config/names.txt') { |f| f.read }
  cluster_names.split("\n")
end

# Return Array of Marvel character name
def marvel_characters
  agent = Mechanize.new
  characters = agent.get('http://marvel.com/characters/browse').search('div.az-list').search('li a')
  characters.map { |character| character.text }.to_a
end

elasticsearch = elasticsearch_clusters
marvel = marvel_characters

puts '--- Characters Count'
puts "Elasticsearch : #{elasticsearch.size}"
puts "Marvel : #{marvel.size}"
puts ''

puts '--- Common Characters Count'
puts (marvel & elasticsearch).size
puts ''

puts '--- Uncommon Characters Count based Elasticsearch'
puts (elasticsearch - marvel).size
puts ''

puts '--- Common Characters Sampling'
puts (marvel & elasticsearch).sample(10)
puts ''

puts '--- Uncommon Characters Sampling based Elasticsearch'
puts (elasticsearch - marvel).sample(10)
