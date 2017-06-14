require 'active_support'
require 'active_support/core_ext'
require 'pp'
require 'faraday'

#
# 最初は https://github.com/youpy/ruby-lastfm を使うことを検討したが
# トークンの認証にウェブ画面を使う必要があったため
# 直接 API をコールして JSON を取得する実装を選択した
#

url = 'http://ws.audioscrobbler.com/2.0/'

conn = Faraday.new(url: url)

#
# artist.search
# http://www.last.fm/api/show/artist.search
#

params = {
  method: 'artist.search',
  artist: 'Cher',
  api_key: ENV['LASTFM_API_KEY'],
  format: 'json',
}

response = conn.get '', params

# {"name"=>"Cher",
#  "listeners"=>"1014188",
#  "mbid"=>"bfcc6d75-a6a5-4bc6-8282-47aec8531818",
#  "url"=>"https://www.last.fm/music/Cher",
#  "streamable"=>"0",
#  "image"=>
#   [{"#text"=>
#      "https://lastfm-img2.akamaized.net/i/u/34s/4c2467672b39f5f94750eaf4da155383.png",
#     "size"=>"small"},
#    {"#text"=>
#      "https://lastfm-img2.akamaized.net/i/u/64s/4c2467672b39f5f94750eaf4da155383.png",
#     "size"=>"medium"},
#    {"#text"=>
#      "https://lastfm-img2.akamaized.net/i/u/174s/4c2467672b39f5f94750eaf4da155383.png",
#     "size"=>"large"},
#    {"#text"=>
#      "https://lastfm-img2.akamaized.net/i/u/300x300/4c2467672b39f5f94750eaf4da155383.png",
#     "size"=>"extralarge"},
#    {"#text"=>
#      "https://lastfm-img2.akamaized.net/i/u/4c2467672b39f5f94750eaf4da155383.png",
#     "size"=>"mega"}]}
pp JSON.parse(response.body)['results']['artistmatches']['artist'].first

#
# artist.getInfo
# http://www.last.fm/api/show/artist.getInfo
#

params = {
  method: 'artist.getinfo',
  artist: 'Cher',
  api_key: ENV['LASTFM_API_KEY'],
  format: 'json',
}

response = conn.get '', params
response_json = JSON.parse(response.body)

# Cher (born Cherilyn Sarkisian; May 20, 1946) is an Oscar ...
pp response_json['artist']['bio']['summary']

# ["Sonny & Cher", "Madonna", "Kylie Minogue", "Céline Dion", "Cyndi Lauper"]
pp response_json['artist']['similar']['artist'].map { |a| a['name'] }
