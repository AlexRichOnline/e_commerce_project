# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

# Page.destroy_all
# UserItem.destroy_all
# Order.destroy_all
# User.destroy_all
# Item.destroy_all
# Category.destroy_all

# about_file = File.read(Rails.root + 'db/about.txt')

# Page.create(title: 'About Us',
#             content: about_file.to_s,
#             permalink: 'about_us')

json_path = Rails.root + 'db/provinces.json'

json_file = File.read(json_path)

provinces = JSON.parse(json_file)

provinces.each do |key, value|
  puts key
  puts value['name']
  total_tax = 0

  value['taxes'].each do |tax|
    total_tax += tax['tax']
  end
  puts total_tax
end

# bulbapedia_url = 'https://bulbapedia.bulbagarden.net'
# bulbapedia_goldenrod_url = bulbapedia_url + '/wiki/Goldenrod_Department_Store'
# bulbpedia_goldenrod_html = open(bulbapedia_goldenrod_url).read
# bulbapedia_goldenrod_doc = Nokogiri::HTML(bulbpedia_goldenrod_html)
# merchant_selector = "//div[@id='mw-content-text'] " \
#                     "//div[@class='thumb tright']/following-sibling::table " \
#                     "//* //th[contains(text(),'IV')]/parent::tr/parent::*"
# stores = bulbapedia_goldenrod_doc.xpath(merchant_selector)
# store_layout_selector = "//li[@class='toclevel-1 tocsection-1'] " \
#                         "//ul //span[contains(text(),'F')]"
# store_floors = bulbapedia_goldenrod_doc.xpath(store_layout_selector)

# store_floors.each do |floor|
#   puts floor.content
# end

# def print_item(item_name, item_cost, item_description, sprit, image)
#   puts "#{item_name} : #{item_cost}"
#   puts "#{item_description}\n"
#   puts "Image: #{image}"
#   puts "Sprit: #{sprit}"
# end

# def process_merchant(category_name, merchant)
#   bulbapedia_url = 'https://bulbapedia.bulbagarden.net'
#   merchant_items = merchant.css('table')

#   merchant_items.each do |item|
#     item_rows = item.css('tr')
#     item_data = item_rows[0].css('td')
#     item_sprite = item_data[0].at_css('img').attribute('src')
#     item_name = item_data[1].at_css('span').content
#     item_link = item_data[1].at_css('a').attribute('href').content
#     item_cost = item_rows[1].at_css('td').content

#     if item_name.include?('TM')
#       tm_name = item_data[1].css('span')[1].content
#       item_name = "#{item_name} #{tm_name}"
#       item_link = item_data[1].css('a')[1].attribute('href').content
#     end

#     next if item_name.downcase.include?('mail')

#     item_page_html = open("#{bulbapedia_url}#{item_link}").read
#     item_page_doc = Nokogiri::HTML(item_page_html)
#     item_desc_selector = "//div[@id='mw-content-text'] //p"
#     item_image_selector = "//table[@class='roundy'] " \
#                           "//table[@class='roundy'] //img"
#     item_description = item_page_doc.xpath(item_desc_selector)[0].content
#     img_index = 1
#     if item_name.include?('TM')
#       item_image_selector = "//div[@id='mw-content-text'] //table //img"
#       img_index = 0
#     end

#     item_large_image_img = item_page_doc.xpath(item_image_selector)[img_index]
#     item_large_image = item_large_image_img.attribute('src')
#     puts category_name
#     print_item(item_name, item_cost, item_description, item_sprite, item_large_image)
#     puts "link to item page: #{item_link}"

#     c = Category.find_by_name(category_name)
#     puts 'Category below:'
#     puts c.inspect
#     new_item = c.items
#                 .build(name: item_name,
#                        price: item_cost,
#                        description: item_description,
#                        sprit: item_sprite,
#                        image: item_large_image).save
#     puts new_item.inspect
#   end
# end

# Category.create(name: store_floors[0].content)
# second_floor = Category.create(name: store_floors[1].content)
# second_floor_merchants = stores[0..1]

# second_floor_merchants.each do |store|
#   process_merchant(second_floor.name, store)
# end

# remaining_floors = store_floors[2..-1]
# remaining_stores = stores[2..-1]

# merchant_floors = Hash[remaining_floors.zip remaining_stores]
# merchant_floors.each do |category, store|
#   c = Category.create(name: category.content)
#   process_merchant(c.name, store)
# end

# # div with id of mw-content-text
# # contains all content of page including tables
# AdminUser.create!(email: 'snake@bigboss.com', password: 'solid_snake', password_confirmation: 'solid_snake') if Rails.env.development?
