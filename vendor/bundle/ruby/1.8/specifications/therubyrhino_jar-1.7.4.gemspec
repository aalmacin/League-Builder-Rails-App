# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{therubyrhino_jar}
  s.version = "1.7.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell", "Karol Bucek"]
  s.date = %q{2012-08-02}
  s.description = %q{Rhino's js.jar classes packaged as a JRuby gem.}
  s.email = ["cowboyd@thefrontside.net", "self@kares.org"]
  s.homepage = %q{http://github.com/cowboyd/therubyrhino}
  s.require_paths = ["jar"]
  s.rubyforge_project = %q{therubyrhino}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Rhino's jars packed for therubyrhino}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
