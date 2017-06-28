require 'faraday'
require 'active_support'
require 'active_support/core_ext'
require 'pp'

#
# じゃらん 宿表示 API Lite
# http://www.jalan.net/jw/jwp0100/jww0101.do
# http://www.jalan.net/jalan/doc/jws/data/area.html
#

url = 'http://jws.jalan.net/APILite/HotelSearch/V1/'

params = {
  key: ENV['JALAN_API_KEY'], # APIキー
  pref: '130000',            # 都道府県コード : 東京
  count: 2,                  # 表示件数 : 2件
}

conn = Faraday.new(url: url)
response = conn.get '', params

# {"Results"=>
#   {"xmlns"=>"jws",
#    "NumberOfResults"=>"1037",
#    "DisplayPerPage"=>"2",
#    "DisplayFrom"=>"1",
#    "APIVersion"=>"1.3",
#    "Hotel"=>
#     [{"HotelID"=>"300002",
#       "HotelName"=>"フレックステイイン清澄白河",
#       "PostCode"=>"135-0006",
#       "HotelAddress"=>"東京都江東区常盤１－１２－１６",
#       "Area"=>
#        {"Region"=>"首都圏",
#         "Prefecture"=>"東京都",
#         "LargeArea"=>"葛飾・江戸川・江東",
#         "SmallArea"=>"江東"},
#       "HotelType"=>"ホテル",
#       "HotelDetailURL"=>
#        "http://www.jalan.net/JwsRedirect.do?key=aqr15c3fb2e16e&rd_key=MzAwMDAyLDAwLDAw",
#       "HotelCatchCopy"=>"大手町より3駅★都内各処へアクセス良好★清澄白河・森下2駅利用可",
#       "HotelCaption"=>
#        "お一人様からカップル・グループ・ご家族で、目的に合わせてご利用頂けます。スカイツリー・浅草や東京ドーム、秋葉原・日本橋・東京・新宿・渋谷・六本木など各処へアクセス良好。全室ミニキッチン付。",
#       "PictureURL"=>
#        "http://www.jalan.net/jalan/images/pictM/Y2/Y300002/Y300002081.jpg",
#       "PictureCaption"=>"外観",
#       "AccessInformation"=>
#        ["車以外／ＪＲ新宿駅乗換、都営新宿線森下駅下車、A7出口より徒歩８分",
#         "車以外／丸の内線大手町駅乗換、半蔵門線清澄白河駅、A1出口より徒歩６分",
#         "車／■駐車場は1台のみです。お電話のみの予約受付です。完全電話予約制（9：00～18：00）"],
#       "CheckInTime"=>"14:00",
#       "CheckOutTime"=>"10:00",
#       "X"=>"503276825",
#       "Y"=>"128452668",
#       "LastUpdate"=>{"day"=>"10", "month"=>"04", "year"=>"2014"},
#       "WifiHikariStation"=>nil},
#      {"HotelID"=>"300088",
#       "HotelName"=>"東横イン蒲田東口",
#       "PostCode"=>"144-0052",
#       "HotelAddress"=>"東京都大田区蒲田５－１８－４",
#       "Area"=>
#        {"Region"=>"首都圏",
#         "Prefecture"=>"東京都",
#         "LargeArea"=>"蒲田・大森・羽田周辺",
#         "SmallArea"=>"蒲田・大森・羽田周辺"},
#       "HotelType"=>"ホテル",
#       "HotelDetailURL"=>
#        "http://www.jalan.net/JwsRedirect.do?key=aqr15c3fb2e16e&rd_key=MzAwMDg4LDAwLDAw",
#       "HotelCatchCopy"=>"品川からＪＲで12分！蒲田駅から徒歩1分！アクセス抜群♪",
#       "HotelCaption"=>
#        "珍しいデラックスタイプのツイン・ダブルをご用意。ビジネス以外の方には大変評判の良いお部屋！蒲田駅東口駅前徒歩1分で羽田空港、新幹線へのアクセスも大変良いので観光旅行には是非、ご利用下さいませ。",
#       "PictureURL"=>
#        "http://www.jalan.net/jalan/images/pictM/Y8/Y300088/Y300088001.jpg",
#       "PictureCaption"=>"外観",
#       "CheckInTime"=>"16:00",
#       "CheckOutTime"=>"10:00",
#       "X"=>"502997130",
#       "Y"=>"128013600",
#       "LastUpdate"=>{"day"=>"28", "month"=>"07", "year"=>"2010"},
#       "WifiHikariStation"=>nil}]}}
pp Hash.from_xml(response.body)
