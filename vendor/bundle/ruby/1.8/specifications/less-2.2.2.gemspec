# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{less}
  s.version = "2.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell"]
  s.date = %q{2012-09-04}
  s.default_executable = %q{lessc}
  s.description = %q{Invoke the Less CSS compiler from Ruby}
  s.email = ["cowboyd@thefrontside.net"]
  s.executables = ["lessc"]
  s.files = ["spec/less/faulty/faulty.less", "spec/less/one/one.less", "spec/less/parser_spec.rb", "spec/less/two/two.less", "spec/spec_helper.rb", "bin/lessc"]
  s.homepage = %q{http://lesscss.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{less}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Leaner CSS, in your browser or Ruby (via less.js)}
  s.test_files = ["spec/less/faulty/faulty.less", "spec/less/one/one.less", "spec/less/parser_spec.rb", "spec/less/two/two.less", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<commonjs>, ["~> 0.2.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
    else
      s.add_dependency(%q<commonjs>, ["~> 0.2.6"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<commonjs>, ["~> 0.2.6"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
  end
end
