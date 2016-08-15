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

puts "loading elle kasai emoji cheatsheet list"
doc = File.read(File.join(Dir.pwd, "lib", "elle_kasai_emoji_cheatsheet.json"))
custom_entries = JSON.parse(doc);

puts "loading null list"
doc2 = File.read(File.join(Dir.pwd, "lib", "null_list_rules.json"))
null_entries = JSON.parse(doc2)

puts "list generated, writing csv"
CSV.open(OUTPUT_PATH, "wb") do |csv|
  custom_entries.each do |key, val|
    csv << [key, val]
  end
  null_entries.each do |key, val|
    csv << [key, *val]
  end
end

puts "csv writing complete"


