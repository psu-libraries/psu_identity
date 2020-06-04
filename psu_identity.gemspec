require_relative 'lib/psu_identity/version'

Gem::Specification.new do |spec|
  spec.name          = "psu_identity"
  spec.version       = "0.1.1"
  spec.authors       = ["Alex Kiessling"]
  spec.email         = ["ajkiessl@gmail.com"]

  spec.summary       = %q{Gem for interfacing with psu's search-service}
  spec.description   = %q{Gem for interfacing with psu's search-service}
  spec.homepage      = 'https://github.com/psu-libraries/psu_identity'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
