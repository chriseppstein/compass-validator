# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{compass-validator}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Eppstein"]
  s.date = %q{2009-06-05}
  s.email = %q{chris@eppsteins.net}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION.yml",
    "lib/compass-validator.rb",
    "lib/java_validator/COPYRIGHT.html",
    "lib/java_validator/JIGSAW_COPYRIGHT",
    "lib/java_validator/README.html",
    "lib/java_validator/XERCES_COPYING.txt",
    "lib/java_validator/css-validator-javadoc.jar",
    "lib/java_validator/css-validator.jar",
    "lib/java_validator/jigsaw.jar",
    "lib/java_validator/xerces.jar"
  ]
  s.homepage = %q{http://github.com/chriseppstein/compass-validator}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{A CSS Validator that is used by the Compass CSS Framework.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
