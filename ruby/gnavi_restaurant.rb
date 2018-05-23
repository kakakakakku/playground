require 'faraday'
require 'active_support'
require 'active_support/core_ext'
require 'pp'

#
# ぐるなび レストラン検索 API
# https://api.gnavi.co.jp/api/manual/restsearch/
#

url = 'https://api.gnavi.co.jp/RestSearchAPI/20150630/'

params = {
  keyid: ENV['GNAVI_KEY'],
  format: 'json',
  name: '焼肉',
  hit_per_page: 3
}

conn = Faraday.new(url: url)

response = conn.get '', params
response_json = JSON.parse(response.body)

# "gf30100"
# "尾崎牛と和牛焼肉専門店 ますお 新宿本店"
# "https://r.gnavi.co.jp/p3shw3g10000/?ak=v7cg0fA4q8wPHwRWjyQzdD32OBQCwsqOj6dRVbsy6mk%3D"
# "https://uds.gnst.jp/rest/img/p3shw3g10000/t_0n7z.jpg"

pp response_json['rest'][0]['id']
pp response_json['rest'][0]['name']
pp response_json['rest'][0]['url']
pp response_json['rest'][0]['image_url']['shop_image1']
