require 'csv'

require 'pry'

UNICODE_PATH = File.join(Dir.pwd, "dist", "full_emoji_list.csv")
TWEMOJI_PATH = File.join(Dir.pwd, "dist", "twemoji_list.csv")
NULL_PATH = File.join(Dir.pwd, "dist", "NULL_LIST.csv")
COMBINE_PATH = File.join(Dir.pwd, "dist", "twemoji_unicode_pairs.csv")

unicode_map = {}

CSV.foreach(UNICODE_PATH) do |row|
  unicode_map[row[0].to_sym] = row[1]
end

twemoji_map = {}

CSV.foreach(TWEMOJI_PATH) do |row|
  key = row[0].to_sym
  twemoji_map[key] = unicode_map[key]
end

null_map = {}

twemoji_map.each do |key, val|
  null_map[key] = val if val.nil?
end

CSV.open(NULL_PATH, "wb") do |csv|
  null_map.each do |key, val|
    csv << [key.to_s]
  end
end

CSV.open(COMBINE_PATH, "wb") do |csv|
  twemoji_map.each do |key, val|
    csv << [key.to_s, val]
  end
end

