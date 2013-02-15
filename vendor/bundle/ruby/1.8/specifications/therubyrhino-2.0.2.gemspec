# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{therubyrhino}
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell"]
  s.date = %q{2012-12-05}
  s.description = %q{Call javascript code and manipulate javascript objects from ruby. Call ruby code and manipulate ruby objects from javascript.}
  s.email = %q{cowboyd@thefrontside.net}
  s.homepage = %q{http://github.com/cowboyd/therubyrhino}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{therubyrhino}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Embed the Rhino JavaScript interpreter into JRuby}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<therubyrhino_jar>, [">= 1.7.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<jruby-openssl>, [">= 0"])
    else
      s.add_dependency(%q<therubyrhino_jar>, [">= 1.7.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.10"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<jruby-openssl>, [">= 0"])
    end
  else
    s.add_dependency(%q<therubyrhino_jar>, [">= 1.7.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.10"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<jruby-openssl>, [">= 0"])
  end
end
