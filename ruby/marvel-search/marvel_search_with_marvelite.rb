require 'marvelite'

client = Marvelite::API::Client.new(public_key: 'xxx', private_key: 'xxx')

character = client.characters(name: 'Iron Man')
character_info = character[:data][:results][0]

image_path = character_info[:thumbnail][:path]
image_extension = character_info[:thumbnail][:extension]
image_size = 'standard_amazing'

puts character_info[:name]
puts "#{image_path}/#{image_size}.#{image_extension}"
