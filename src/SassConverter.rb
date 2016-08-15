#######################################################
# CONVERT csv to importable scss variable
#######################################################

require 'csv'

LIST_PATH = File.join(Dir.pwd, "tmp", "twemoji_unicode_pairs.csv")
OUTPUT_PATH = File.join(Dir.pwd, "dist", "emoji_map.scss")

$stdout.sync = true



#######################################################
# GENERATING the key value pairs
#######################################################

puts "generating one-to-one list"

entries = []

# reversing to where the names all point at the codepoint, this way
# the sass list-comprehension can still iterably generate css since
# its a 1-to-1 mapping this way
CSV.foreach(LIST_PATH) do |row|
  code_point = row[0]
  names = row.drop(1)

  # directly creating the string list that will be put to the file
  names.each do |key|
    entries << "#{key} : #{code_point},\n"
  end
end

# these strings are in arrays for easy concatenation
header = ["$emoji-map: (\n"]
footer = [");\n"]

output = header + entries + footer

puts "writing scss..."

File.open(OUTPUT_PATH, "w") do |file|
  file.puts output
end

puts "scss writing complete"

