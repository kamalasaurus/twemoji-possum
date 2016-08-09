require 'open4'
require 'colored'

BASEPATH =  File.join(Dir.pwd, "src")

desc 'run all transforms in sequence'
task default: [:map_unicode, :map_twemoji, :combine_maps, :custom_rules, :convert_to_css]

desc 'map the unicode from source'
task :map_unicode do
  puts "\n"
  puts "Creating Unicode Map".bold.yellow
  puts "\n"
    Open4.popen4("ruby #{File.join(BASEPATH, "UnicodeMapper.rb")}") do |pid, stdin, stdout, stderr|
    stdout.each { |line| puts line }
  end
  puts "\n"
  puts "Generated map of Unicode 'code point' : 'human name'".bold.green
end

#task :map_twemoji do
  #TwemojiMapper.generateCSV
  #puts "Generated list of Twemoji code points"
#end

#task :combine_maps do
  #CombineMapper.generateCSV
  #puts "Generated map of Twemoji 'code point' : 'human name' and lists of unused values"
#end

#task :custom_rules do
  #CustomMapper.generateCSV
  #puts "Completed map by resolving unused value edge cases with custom rules"
#end

#task :convert_to_css do
  #CssConverter.generateCss
  #puts "importable Css file for "
#end

