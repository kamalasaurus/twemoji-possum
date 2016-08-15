require 'csv'
require 'colored'

$stdout.sync = true

UNICODE_PATH = File.join(Dir.pwd, "dist", "full_emoji_list.csv")
TWEMOJI_PATH = File.join(Dir.pwd, "dist", "twemoji_list.csv")
CUSTOM_PATH = File.join(Dir.pwd, "dist", "custom_list.csv")
NULL_PATH = File.join(Dir.pwd, "dist", "NULL_LIST.csv")
COMBINE_PATH = File.join(Dir.pwd, "dist", "twemoji_unicode_pairs.csv")

unicode_map = {}

CSV.foreach(UNICODE_PATH) do |row|
  unicode_map[row[0].to_sym] = row[1]
end

custom_map = {}

CSV.foreach(CUSTOM_PATH) do |row|
  custom_map[row[0].to_sym] = row[1]
end

twemoji_map = {}

CSV.foreach(TWEMOJI_PATH) do |row|
  key = row[0].to_sym
  twemoji_map[key] = [unicode_map[key]]
  twemoji_map[key] << custom_map[key] if !custom_map[key].nil?
end

null_map = {}

twemoji_map.each do |key, val|
  null_map[key] = val if val.nil?
end

if !null_map.empty?
  puts "there are unresolved code points, investigate at dist/NULL_LIST.csv".bold.red
end

CSV.open(NULL_PATH, "wb") do |csv|
  null_map.each do |key, val|
    csv << [key.to_s]
  end
end

CSV.open(COMBINE_PATH, "wb") do |csv|
  twemoji_map.each do |key, val|
    csv << [key.to_s, *val]
  end
end



