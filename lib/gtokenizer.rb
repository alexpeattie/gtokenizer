require "gtokenizer/version"

module GTokenizer
  PARSER_REGEX = /([A-GJXa-gjx]#|\$?[0-9.]+|[a-zA-Z&_0-9]+('s)?\+*|[\-.!@%^*()\[\]\={"'\\}|:;<,>?\/~`.\$#+])/
  
  # input is the string to be tokenized
  # returns an array of tokens as strings
  def self.parse(input)
    input.scan(PARSER_REGEX).map {|t| t[0]}
  end
end