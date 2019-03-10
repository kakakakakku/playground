# https://github.com/kamui/retriable
require 'retriable'

attempt = 0

begin
  Retriable.retriable(base_interval: 1.0, tries: 9) do
    now = Time.now
    puts '[処理開始] ' + now.to_s
    attempt += 1
    raise StandardError
  end
rescue StandardError
  puts '----------------------------------------------------------------'
  puts 'リトライを' + attempt.to_s + '回繰り返しましたが、エラーは解消しませんでした'
  puts '----------------------------------------------------------------'
end
