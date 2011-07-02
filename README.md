# GTokenizer

**GTokenizer** recreates the closed-source tokenization library used by Google for their Google NGrams app (http://ngrams.googlelabs.com/), based on the information in the associated _Science_ paper (http://www.sciencemag.org/content/suppl/2010/12/16/science.1199644.DC1/Michel.SOM.revision.2.pdf).

## Installation

Install the gem via rubygems.

    gem install gtokenizer
  
## Usage

You can extract tokens from a string using the `GTokenizer.parse` method. 

```ruby
require 'gtokenizer'

#---

GTokenizer.parse("I saw the man with the telescope")
  #=> ["I", "saw", "the", "man", "with", "the", "telescope"]
```

## How does the tokenizer work?

In general, 1 word = 1 token.

```ruby
GTokenizer.parse("Hello world")
  #=> ["Hello", "world"]
```

Punctuation is usually tokenized seperately.

```ruby
GTokenizer.parse("Hello world?")
  #=> ["Hello", "world", "?"]
```

Hyphenated words thus create three tokens.

```ruby
GTokenizer.parse("Good-day world")
  #=> ["Good", "-", "day", "world"]
```

& and _ are not treated as seperate tokens.

```ruby
GTokenizer.parse("HKEY_LOCAL_MACHINE AT&T")
  #=> ["Good", "-", "day", "world"]
```

Prices are treated as a single token.

```ruby
GTokenizer.parse("$9.99")
  #=> ["$9.99"]
```

For a fuller understanding of the mechanics of the tokenizer, see the specs, or Google's detailed outline in _Science_ (http://www.sciencemag.org/content/suppl/2010/12/16/science.1199644.DC1/Michel.SOM.revision.2.pdf).

## License

GTokenizer is licensed under the [MIT License](http://creativecommons.org/licenses/MIT/):

    Copyright (c) 2011 Alex Peattie (http://www.alexpeattie.com)
   
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
   
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
   
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.