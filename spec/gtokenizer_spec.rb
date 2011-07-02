require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "GTokenizer" do
  it "tokenizes words" do
    tokens = GTokenizer::parse("I saw the man with the telescope")
    tokens.should == ["I", "saw", "the", "man", "with", "the", "telescope"]
  end
  
  it "tokenizes special characters" do
    tokens = GTokenizer::parse("mail@domain.com !%^*()[]\\-={\"}|:;<,>?\/~`.$#+")
    tokens.should == ["mail", "@", "domain", ".", "com", "!", "%", "^", "*", "(", ")", "[", "]", "\\", "-", "=", "{", "\"", "}", "|", ":", ";", "<", ",", ">", "?", "/", "~", "`", ".", "$", "#", "+"]
  end

  it "tokenizes apostrophes that don't precede an s" do
    tokens = GTokenizer::parse("It's obvious that the parents' meeting won't be useful")
    tokens.should == ["It's", "obvious", "that", "the", "parents", "'", "meeting", "won", "'", "t", "be", "useful"]
  end

  it "doesn't tokenize underscores and apostrophes" do
    tokens = GTokenizer::parse("HKEY_LOCAL_MACHINE AT&T")
    tokens.should == ["HKEY_LOCAL_MACHINE", "AT&T"]
  end

  it "tokenizes numbers and prices as a single token" do
    tokens = GTokenizer::parse("1.5 feet of tape costs $1.99")
    tokens.should == ["1.5", "feet", "of", "tape", "costs", "$1.99"]
  end

  it "doesn't tokenize # proceeding the letters a-g, j or x" do
    tokens = GTokenizer::parse("A# b# C# d# E# g# J# and X# but not Q#")
    tokens.should == ["A#", "b#", "C#", "d#", "E#", "g#", "J#", "and", "X#", "but", "not", "Q", "#"]
  end

  it "doesn't tokenize + proceeding an alphanumeric sequence" do
    tokens = GTokenizer::parse("C++ or Na2+ but not 1+2")
    tokens.should == ["C++", "or", "Na2+", "but", "not", "1", "+", "2"]
  end

  it "tokenizes a string with a mixture of words, numbers, special characters" do
    tokens = GTokenizer::parse("Use C++, it's better than C# and it only costs $2.99!! Visit http://www.cplusplus.com/more_info_1 to learn more.")
    tokens.should == ["Use", "C++", ",", "it's", "better", "than", "C#", "and", "it", "only", "costs", "$2.99", "!", "!", "Visit", "http", ":", "/", "/", "www", ".", "cplusplus", ".", "com", "/", "more_info_1", "to", "learn", "more", "."]
  end
end
