# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{therubyracer}
  s.version = "0.11.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell"]
  s.date = %q{2013-01-16}
  s.description = %q{Call JavaScript code and manipulate JavaScript objects from Ruby. Call Ruby code and manipulate Ruby objects from JavaScript.}
  s.email = ["javascript-and-friends@googlegroups.com"]
  s.extensions = ["ext/v8/extconf.rb"]
  s.files = ["spec/c/array_spec.rb", "spec/c/constants_spec.rb", "spec/c/exception_spec.rb", "spec/c/external_spec.rb", "spec/c/function_spec.rb", "spec/c/handles_spec.rb", "spec/c/locker_spec.rb", "spec/c/object_spec.rb", "spec/c/script_spec.rb", "spec/c/string_spec.rb", "spec/c/template_spec.rb", "spec/c/trycatch_spec.rb", "spec/mem/blunt_spec.rb", "spec/redjs_spec.rb", "spec/spec_helper.rb", "spec/threading_spec.rb", "spec/v8/context_spec.rb", "spec/v8/conversion_spec.rb", "spec/v8/error_spec.rb", "spec/v8/function_spec.rb", "spec/v8/object_spec.rb", "ext/v8/extconf.rb"]
  s.homepage = %q{http://github.com/cowboyd/therubyracer}
  s.require_paths = ["lib", "ext"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Embed the V8 JavaScript interpreter into Ruby}
  s.test_files = ["spec/c/array_spec.rb", "spec/c/constants_spec.rb", "spec/c/exception_spec.rb", "spec/c/external_spec.rb", "spec/c/function_spec.rb", "spec/c/handles_spec.rb", "spec/c/locker_spec.rb", "spec/c/object_spec.rb", "spec/c/script_spec.rb", "spec/c/string_spec.rb", "spec/c/template_spec.rb", "spec/c/trycatch_spec.rb", "spec/mem/blunt_spec.rb", "spec/redjs_spec.rb", "spec/spec_helper.rb", "spec/threading_spec.rb", "spec/v8/context_spec.rb", "spec/v8/conversion_spec.rb", "spec/v8/error_spec.rb", "spec/v8/function_spec.rb", "spec/v8/object_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ref>, [">= 0"])
      s.add_runtime_dependency(%q<libv8>, ["~> 3.11.8.12"])
    else
      s.add_dependency(%q<ref>, [">= 0"])
      s.add_dependency(%q<libv8>, ["~> 3.11.8.12"])
    end
  else
    s.add_dependency(%q<ref>, [">= 0"])
    s.add_dependency(%q<libv8>, ["~> 3.11.8.12"])
  end
end
