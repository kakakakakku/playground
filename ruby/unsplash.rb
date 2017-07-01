require 'unsplash'
require 'active_support'
require 'active_support/core_ext'

Unsplash.configure do |config|
  config.application_id = ENV['UNSPLASH_APPLICATION_ID']
  config.application_secret = ENV['UNSPLASH_SECRET']
  config.application_redirect_uri = 'https://example.com/callback'
  config.utm_source = 'example_app'
end

def info(photo)
  # Basic
  puts "===== #{photo.id} ====="
  puts photo.width
  puts photo.height

  # Exif
  if photo.exif.present?
    puts photo.exif.make
    puts photo.exif.model
    puts photo.exif.iso
  end

  # Location
  if photo.location.present?
    puts photo.location.city
    puts photo.location.country
  end

  # URL
  if photo.urls.present?
    puts photo.urls.raw
    puts photo.urls.full
    puts photo.urls.thumb
  end
end

# Find by id
photo = Unsplash::Photo.find('srDN5nHM35g')
info(photo)

# Search by keyword
search_results = Unsplash::Photo.search('mountain', page = 1, per_page = 3)
search_results.each do |photo|
  info(photo)
end

# Search curation ( latest, oldest, popular )
search_results = Unsplash::Photo.curated(page = 1, per_page = 3, 'popular')
search_results.each do |photo|
  info(photo)
end

# Search random
photo = Unsplash::Photo.random
info(photo)
