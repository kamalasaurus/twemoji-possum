#######################################################
# TWEMOJI SCRAPER: the source is located at:
# https://twemoji.maxcdn.com/2/test/preview.html
#######################################################

require 'nokogiri'
require 'open-uri'
require 'csv'

require 'pry'

module TwemojiMapper

  @URL = "https://twemoji.maxcdn.com/2/test/preview.html"
  @OUTPUT_PATH = File.join(File.expand_path("..", Dir.pwd), "tmp", "twemoji_list.csv")


#######################################################
# FUNCTIONS: for process legibility
#######################################################

  def self.codeOf node

  end


#######################################################
# ANONYMOUS FXNS: for call-chaining legibility
#######################################################

  @pngName = lambda do |node|
    binding.pry
    self.codeOf node
  end



#######################################################
# CALLING THE SCRAPE/MAP PROCESS, WRITING THE LIST
#######################################################

  def self.generateCSV
    puts "generating twemoji code point list"

    puts "loading full twemoji list"
    doc = Nokogiri::HTML(open(@URL))

    binding.pry

    puts "twemoji list loaded, converting to list"
    twemoji_entries = doc
      .css("li img")
      .map(&@pngName)

    puts "list generated, writing csv"
    CSV.open(@OUTPUT_PATH, "wb") do |csv|
      twemoji_entries.each do |entry|
        csv << entry
      end
    end

    puts "csv writing complete"
  end


end


