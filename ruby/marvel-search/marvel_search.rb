require 'mechanize'

module MarvelSearch

  class Character
    attr_accessor :name
    attr_accessor :image_url
  end

  class Search
    def initialize
      @agent = Mechanize.new
    end

    def search(keyword)
      character_link = @agent.get('http://marvel.com/characters/browse').link_with(text: keyword)
      if !character_link.nil?
        character = Character.new
        character.name = character_link.click.at('h1.featured-item-title a').text
        character.image_url = character_link.click.at('a.row-item-image-url img')['src']
        character
      else
        nil
      end
    end
  end

end

marvel_search = MarvelSearch::Search.new

character = marvel_search.search('Iron Man')

if !character.nil?
  puts character.name
  puts character.image_url
end
