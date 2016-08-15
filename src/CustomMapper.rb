#######################################################
# CUSTOM RULE MAPPING
# credit to Elle Kasai for mapping the values from
# emoji cheatsheet
#######################################################

require 'json'
require 'csv'

OUTPUT_PATH = File.join(Dir.pwd, "dist", "custom_list.csv")

$stdout.sync = true



#######################################################
# CALLING THE SCRAPE/MAP PROCESS, WRITING THE LIST
#######################################################

puts "generating custom code point list"

puts "loading custom list"
doc = File.read(File.join(Dir.pwd, "lib", "elle_kasai_emoji_cheatsheet.json"))
custom_entries = JSON.parse(doc);

puts "custom list loaded, converting to list"

puts "list generated, writing csv"
CSV.open(OUTPUT_PATH, "wb") do |csv|
  custom_entries.each do |key, val|
    csv << [key, val]
  end
end

puts "csv writing complete"


