# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gtokenizer/version"

Gem::Specification.new do |s|
  s.name        = "gtokenizer"
  s.version     = GTokenizer::VERSION
  s.authors     = ["Alex Peattie"]
  s.email       = ["alexpeattie@gmail.com"]
  s.homepage    = "https://github.com/alexpeattie/gtokenizer"
  s.summary     = "A very simple string tokenizer, based on the one used by Google for their Google NGrams app (http://ngrams.googlelabs.com/)"
  s.description = "GTokenizer recreates the closed-source tokenization library used by Google for their Google NGrams app (http://ngrams.googlelabs.com/), based on the information in the associated Science paper (http://www.sciencemag.org/content/suppl/2010/12/16/science.1199644.DC1/Michel.SOM.revision.2.pdf)"

  s.add_development_dependency "rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
