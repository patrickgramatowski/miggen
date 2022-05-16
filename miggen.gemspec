# frozen_string_literal: true

require_relative "lib/miggen/version"

Gem::Specification.new do |spec|
  spec.name = "miggen"
  spec.version = Miggen::VERSION
  spec.authors = ["Patrick Gramatowski"]
  spec.email = ["patrick.gramatowski@gmail.com"]

  spec.summary = "Generate migrations based on database diagrams."
  spec.description = "Have you created database diagrams and want to generate migrations based on them? Use our gem!"
  spec.homepage = "https://github.com/patrickgramatowski/miggen"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
