# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
WEBSITE = "http://kultofathena.com"
PROPERTIES = {
              total_length: "Overall Length:",
              blade_length: "Blade:",
              weight: "Weight:",
              edge: "Edge:",
              pob: "P.O.B:",
              thickiness: "Thickness:",
              width: "Width:",
              hilt_length: "Grip Length:"
            }

puts "=== Initializing Mechanize ==="
agent = Mechanize.new
main_page = agent.get("#{WEBSITE}/swords-stage.asp")
product_links = main_page.links.select do |link|
  !link.href.nil? && link.href.match("product")
end

puts "=== Begin seeding ==="
count = 0
product_links.each do |link|
  sword_page = agent.get("#{WEBSITE}/#{link.href}")
  tds = sword_page.search('td')
  in_stock = tds.any? { |td| !td.nil? && td.text.downcase.match("in stock")}
  prices = agent.get("#{WEBSITE}/#{link.href}").search("font").select { |font| !font.nil? && font.text.match(/\$\d+/)}
  if prices.first.text[0] == "$"
    price = prices.first.text.gsub("$", "")
  else
    price = prices.last.text.gsub("$", "")
  end

  sword_name = link.href.split("name=").last.gsub('+', ' ')[0...-1]
  sword_item = link.href.split("item=").last.split("&").first
  sword_properties = {
    name: sword_name, 
    item: sword_item, 
    page_url: "#{WEBSITE}/#{link.href}",
    img_url: "#{WEBSITE}/images/#{sword_item}.jpg",
    in_stock: in_stock ? "In Stock" : "Not in stock",
    price: price}
  PROPERTIES.each do |property, property_text|
    value_blob = tds.select { |td| !td.nil? && td.text.match(property_text)}.first
    next if value_blob.blank?
    value_blob = value_blob.text
    value = value_blob.split(property_text).last.split("\r").first.split(" ").first.gsub(/\s/,"").strip
    if value[0].ord > 122 || value[0].ord < 48
      value = value[1..-1]
    end
    sword_properties[property] = value
  end
  Sword.create(sword_properties)
  count += 1
  print "."
  print count / 10 if count % 10 == 0
end
puts "!"
puts "=== All done ==="


# Overall Length: 37 1/4'' Blade: 29 3/8''  
# $186.95 
#  Submit
# Usually Ships in 3-4 Weeks 
# Weight: 2 lb 13.8 oz
# Edge: Blunt
# P.O.B.: 1 1/4''
# Thickness: 3.7 mm - 3.2 mm
# Width: 38.8 mm
# Grip Length: 4 3/4''