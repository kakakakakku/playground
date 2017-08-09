require 'twitter'
require 'pp'

#
# https://github.com/sferik/twitter
# https://github.com/sferik/twitter/tree/master/examples
#

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
end

client.search('kakakakakku', result_type: 'recent').take(3).collect do |tweet|
  pp tweet.id
  pp tweet.user.screen_name
  pp tweet.text
  pp '====='
end
