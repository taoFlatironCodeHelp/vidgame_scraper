# frozen_string_literal: true

require_relative "lib/vidgame_scraper/version"

Gem::Specification.new do |spec|
  spec.name          = "vidgame_scraper"
  spec.version       = VidgameScraper::VERSION
  spec.authors       = ["Julio Aguilera Jr"]
  spec.email         = ["julioaguilera337@gmail.com"]

  spec.summary       = "this CLI will list all the items that are for sale."
  spec.description   = "It will show you all the video game category for sale in the craigslist website."
  spec.homepage      = "https://github.com/WildBeanOnIt/vidgame_scraper"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/WildBeanOnIt/vidgame_scraper"
  spec.metadata["changelog_uri"] = "https://github.com/WildBeanOnIt/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "colorize"
  spec.add_development_dependency "colorized_string"
  spec.add_development_dependency "pry"


  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
