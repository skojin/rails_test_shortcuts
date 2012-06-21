# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Sergey Kojin"]
  gem.email         = ["sergey.kojin@gmail.com"]
  gem.description   = %q{Set of tasks to type less when call tests}
  gem.summary       = %q{Shortcuts for rails tests}
  gem.homepage      = "https://github.com/skojin/rails_test_shortcuts"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rails_test_shortcuts"
  gem.require_paths = ["lib"]
  gem.version       = '0.0.1'
end
