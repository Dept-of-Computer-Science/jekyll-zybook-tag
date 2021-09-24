# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-zybook-tag"
  spec.version       = "0.1.2"
  spec.authors       = ["Albert Lionelle"]
  spec.email         = ["Albert.Lionelle@colostate.edu"]

  spec.summary       = "Jekyll-zybook Tag for include zybooks content from Semester to Semester, developed to work with Colorado State University Courses, but can be used for any course that uses zybooks and jekyll."
  spec.homepage      = "https://github.com/Dept-of-Computer-Science/jekyll-zybook-tag"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(jekyll-zybook-tag|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"

end
