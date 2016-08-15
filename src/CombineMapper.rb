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

combine_map = {}

CSV.foreach(TWEMOJI_PATH) do |row|
  key = row[0].to_sym
  combine_map[key] = [unicode_map[key]]

  if !custom_map[key].nil?
    if unicode_map[key].nil?
      combine_map[key] = [custom_map[key]]
    else
      combine_map[key] << custom_map[key]
    end
  end
end

null_map = {}

combine_map.each do |key, val|
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
  combine_map.each do |key, val|
    csv << [key.to_s, *val]
  end
end

puts "maps combined!"

