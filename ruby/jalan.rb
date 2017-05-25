require 'faraday'
require 'active_support'
require 'active_support/core_ext'
require 'pp'

#
# じゃらん 温泉検索 API
# http://www.jalan.net/jw/jwp0100/jww0104.do
# http://www.jalan.net/jalan/doc/jws/data/area.html
#

url = 'http://jws.jalan.net/APICommon/OnsenSearch/V1/'

params = {
  key: ENV['JALAN_API_KEY'], # APIキー
  pref: '130000',            # 都道府県コード : 東京
  count: 3,                  # 表示件数 : 3件
}

conn = Faraday.new(url: url)
response = conn.get '', params

# {"Results"=>
#   {"xmlns"=>"jws",
#    "NumberOfResults"=>"23",
#    "DisplayPerPage"=>"3",
#    "DisplayFrom"=>"1",
#    "APIVersion"=>"1.1",
#    "Onsen"=>
#     [{"OnsenName"=>"数馬温泉",
#       "OnsenNameKana"=>"かずまおんせん",
#       "OnsenID"=>"0768",
#       "OnsenAddress"=>"東京都西多摩郡檜原村数馬",
#       "Area"=>
#        {"Region"=>"首都圏",
#         "Prefecture"=>"東京都",
#         "LargeArea"=>"青梅・奥多摩",
#         "SmallArea"=>"奥多摩"},
#       "NatureOfOnsen"=>"硫黄泉",
#       "OnsenAreaID"=>nil},
#      {"OnsenName"=>"松乃温泉",
#       "OnsenNameKana"=>"まつのおんせん",
#       "OnsenID"=>"0769",
#       "OnsenAddress"=>"東京都西多摩郡奥多摩町川井",
#       "Area"=>
#        {"Region"=>"首都圏",
#         "Prefecture"=>"東京都",
#         "LargeArea"=>"青梅・奥多摩",
#         "SmallArea"=>"奥多摩"},
#       "NatureOfOnsen"=>"硫黄泉",
#       "OnsenAreaID"=>nil},
#      {"OnsenName"=>"岩蔵温泉",
#       "OnsenNameKana"=>"いわくらおんせん",
#       "OnsenID"=>"0770",
#       "OnsenAddress"=>"東京都青梅市富岡・小曽木",
#       "Area"=>
#        {"Region"=>"首都圏",
#         "Prefecture"=>"東京都",
#         "LargeArea"=>"青梅・奥多摩",
#         "SmallArea"=>"青梅"},
#       "NatureOfOnsen"=>"硫黄泉",
#       "OnsenAreaID"=>"50130"}]}}
pp Hash.from_xml(response.body)
