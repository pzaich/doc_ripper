# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doc_ripper/version'

Gem::Specification.new do |spec|
  spec.name          = "doc_ripper"
  spec.version       = DocRipper::VERSION
  spec.authors       = ["Paul Zaich"]
  spec.email         = ["pzaich@gmail.com"]
  spec.summary       = %q{Rip out text from pdf, doc and docx formats}
  spec.description   = %q{Scrape text from common file formats (.pdf,.doc,.docx, .sketch, .txt) with a single convenient command.}
  spec.homepage      = "https://github.com/pzaich/doc_ripper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.requirements << 'Antiword'
  spec.requirements << "pdftotext/poppler"

  spec.add_dependency "sqlite3", "~> 1.3.11"
  spec.add_dependency "CFPropertyList", '~> 2.3'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
