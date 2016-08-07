#######################################################
# UNICODE SCRAPER: return code point : name
# pairs from the authoritative emoji list at
# http://unicode.org/emoji/charts/full-emoji-list.html
#######################################################

require 'nokogiri'
require 'open-uri'
require 'csv'

UNICODE_URL = "http://unicode.org/emoji/charts/full-emoji-list.html"



#######################################################
# FUNCTIONS: for process legibility
#######################################################

def numberOf node
  node.css("td.rchars")[0]
    .children
    .text
    .to_i
end

def codeOf node
  node.css("td.code a")[0]
    .attributes["name"]
    .value
    .gsub("_", "-")
end

def nameOf node
  node.css("td.name")[0]
    .children
    .text
    .downcase
    .strip
    .gsub(/\s+/, "-")
    .gsub(/,/, "")
    .gsub(/:/, "")
end

def flagNameOf node
  node.css("td.name")[1]
    .children
    .css("a")
    .children
    .map {|child| child.text.downcase.strip }
    .join("-")
    .gsub(/\s+/, "-")
    .gsub(/,/, "")
end

def substituteEquivalent str
  str.include?("≊") ? str.split("≊")[1].strip.sub(/^-/, '') : str
end



#######################################################
# ANONYMOUS FXNS: for call-chaining legibility
#######################################################

withoutHeaders = lambda { |node| node.child.name != "th" }

codeToName = lambda do |node|
  row = numberOf node
  code_point = codeOf node

  if row >= 1535
    human_name = flagNameOf node
  else
    human_name = substituteEquivalent nameOf node
  end

  [ code_point, human_name ]
end

puts "generating unicode hex code point to human readable names list"



#######################################################
# CALLING THE SCRAPE AND MAP PROCESS
#######################################################

puts "loading full emoji list"
doc = Nokogiri::HTML(open(UNICODE_URL))

puts "emoji list loaded, converting to map"
emoji_entries = doc
  .css("tr")
  .select(&withoutHeaders)
  .map(&codeToName)



#######################################################
# WRITING THE LIST
#######################################################

puts "map generated, writing csv"
CSV.open("full_emoji_list.csv", "wb") do |csv|
  emoji_entries.each do |entry|
    csv << entry
  end
end

puts "csv writing complete"

