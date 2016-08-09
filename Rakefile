require 'open4'
require 'colored'

def runTask scriptPath
  Open4.popen4("ruby #{File.join(Dir.pwd, "src", scriptPath)}") do |pid, stdin, stdout, stderr|
    stdout.each { |line| puts line }
    stderr.each { |line| puts line }
  end
end

desc 'run all transforms in sequence'
task default: [:map_unicode, :map_twemoji, :combine_maps, :custom_rules, :convert_to_css]

desc 'map unicode from source'
task :map_unicode do
  puts "\n"
  puts "Creating Unicode Map".bold.yellow
  puts "\n"
  runTask("UnicodeMapper.rb");
  puts "\n"
  puts "Generated map of Unicode 'code point' : 'human name'".bold.green
end

desc 'map twemoji from source'
task :map_twemoji do
  puts "\n"
  puts "Creating Twemoji Map".bold.yellow
  puts "\n"
  runTask("TwemojiMapper.rb")
  puts "\n"
  puts "Generated list of Twemoji code points".bold.green
end

#desc 'combine maps'
#task :combine_maps do
  #CombineMapper.generateCSV
  #puts "Generated map of Twemoji 'code point' : 'human name' and lists of unused values"
#end

#desc 'apply custom rules from Elle Kasai (emoji cheat sheet) and twitter custom icons'
#task :custom_rules do
  #CustomMapper.generateCSV
  #puts "Completed map by resolving unused value edge cases with custom rules"
#end

#task :convert_to_css do
  #CssConverter.generateCss
  #puts "importable Css file for "
#end

