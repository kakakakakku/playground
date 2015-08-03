require 'mechanize'

agent = Mechanize.new
books = agent.get('http://www.oreilly.co.jp/catalog/').search('tbody tr')
amount = books.map { |book| book.search('.price').text.delete(',').to_i }.inject(:+)
puts "総額 : #{amount} 円 (全 #{books.size} 冊)"
