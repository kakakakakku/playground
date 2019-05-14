# https://github.com/kamui/retriable
require 'retriable'

attempt = 0

begin
  Retriable.retriable(base_interval: 1.0, tries: 9) do
    now = Time.now
    puts ' エラー🔥' if attempt >= 1
    print '[処理開始] ' + now.to_s
    attempt += 1
    raise StandardError
  end
rescue StandardError
  puts ' エラー🔥'
  puts '----------------------------------------------------------------'
  puts 'リトライを' + attempt.to_s + '回繰り返しましたが、エラーは解消しませんでした'
  puts '----------------------------------------------------------------'
end
