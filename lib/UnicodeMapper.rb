#######################################################
# UNICODE SCRAPER: return code point : name
# pairs from the authoritative emoji list at
# http://unicode.org/emoji/charts/full-emoji-list.html
#######################################################

require 'nokogiri'
require 'open-uri'
require 'csv'

module UnicodeMapper

  @URL =  "http://unicode.org/emoji/charts/full-emoji-list.html"
  @OUTPUT_PATH = File.join(File.expand_path("..", Dir.pwd), "tmp", "full-emoji-list.csv")


#######################################################
# FUNCTIONS: for process legibility
#######################################################

  def self.numberOf node
    node.css("td.rchars")[0]
      .children
      .text
      .to_i
  end

  def self.codeOf node
    node.css("td.code a")[0]
      .attributes["name"]
      .value
      .gsub("_", "-")
  end

  def self.nameOf node
    node.css("td.name")[0]
      .children
      .text
      .downcase
      .strip
      .gsub(/\s+/, "-")
      .gsub(/,/, "")
      .gsub(/:/, "")
  end

  def self.flagNameOf node
    node.css("td.name")[1]
      .children
      .css("a")
      .children
      .map {|child| child.text.downcase.strip }
      .join("-")
      .gsub(/\s+/, "-")
      .gsub(/,/, "")
  end

  def self.substituteEquivalent str
    str.include?("≊") ? str.split("≊")[1].strip.sub(/^-/, '') : str
  end



#######################################################
# ANONYMOUS FXNS: for call-chaining legibility
#######################################################

  @withoutHeaders = lambda { |node| node.child.name != "th" }

  @codeToName = lambda do |node|
    row = self.numberOf node
    code_point = self.codeOf node

    if row >= 1535
      human_name = self.flagNameOf node
    else
      human_name = self.substituteEquivalent self.nameOf node
    end

    [ code_point, human_name ]
  end



#######################################################
# CALLING THE SCRAPE/MAP PROCESS, WRITING THE LIST
#######################################################

  def self.generateCSV
    puts "generating unicode hex code point to human readable names list"

    puts "loading full emoji list"
    doc = Nokogiri::HTML(open(@URL))

    puts "emoji list loaded, converting to map"
    emoji_entries = doc
      .css("tr")
      .select(&@withoutHeaders)
      .map(&@codeToName)

    puts "map generated, writing csv"
    CSV.open(@OUTPUT_PATH, "wb") do |csv|
      emoji_entries.each do |entry|
        csv << entry
      end
    end

    puts "csv writing complete"
  end


end

