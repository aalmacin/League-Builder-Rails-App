# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{thor}
  s.version = "0.17.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yehuda Katz", "Jos\303\251 Valim"]
  s.date = %q{2013-01-24}
  s.description = %q{A scripting framework that replaces rake, sake and rubigen}
  s.email = %q{ruby-thor@googlegroups.com}
  s.executables = ["rake2thor", "thor"]
  s.files = ["spec/actions/create_file_spec.rb", "spec/actions/create_link_spec.rb", "spec/actions/directory_spec.rb", "spec/actions/empty_directory_spec.rb", "spec/actions/file_manipulation_spec.rb", "spec/actions/inject_into_file_spec.rb", "spec/actions_spec.rb", "spec/base_spec.rb", "spec/core_ext/hash_with_indifferent_access_spec.rb", "spec/core_ext/ordered_hash_spec.rb", "spec/exit_condition_spec.rb", "spec/fixtures/application.rb", "spec/fixtures/app{1}/README", "spec/fixtures/bundle/execute.rb", "spec/fixtures/bundle/main.thor", "spec/fixtures/doc/%file_name%.rb.tt", "spec/fixtures/doc/COMMENTER", "spec/fixtures/doc/README", "spec/fixtures/doc/block_helper.rb", "spec/fixtures/doc/components/.empty_directory", "spec/fixtures/doc/config.rb", "spec/fixtures/doc/config.yaml.tt", "spec/fixtures/enum.thor", "spec/fixtures/group.thor", "spec/fixtures/invoke.thor", "spec/fixtures/path with spaces", "spec/fixtures/preserve/script.sh", "spec/fixtures/script.thor", "spec/fixtures/task.thor", "spec/group_spec.rb", "spec/invocation_spec.rb", "spec/parser/argument_spec.rb", "spec/parser/arguments_spec.rb", "spec/parser/option_spec.rb", "spec/parser/options_spec.rb", "spec/rake_compat_spec.rb", "spec/register_spec.rb", "spec/runner_spec.rb", "spec/shell/basic_spec.rb", "spec/shell/color_spec.rb", "spec/shell/html_spec.rb", "spec/shell_spec.rb", "spec/spec_helper.rb", "spec/task_spec.rb", "spec/thor_spec.rb", "spec/util_spec.rb", "bin/rake2thor", "bin/thor"]
  s.homepage = %q{http://whatisthor.com/}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A scripting framework that replaces rake, sake and rubigen}
  s.test_files = ["spec/actions/create_file_spec.rb", "spec/actions/create_link_spec.rb", "spec/actions/directory_spec.rb", "spec/actions/empty_directory_spec.rb", "spec/actions/file_manipulation_spec.rb", "spec/actions/inject_into_file_spec.rb", "spec/actions_spec.rb", "spec/base_spec.rb", "spec/core_ext/hash_with_indifferent_access_spec.rb", "spec/core_ext/ordered_hash_spec.rb", "spec/exit_condition_spec.rb", "spec/fixtures/application.rb", "spec/fixtures/app{1}/README", "spec/fixtures/bundle/execute.rb", "spec/fixtures/bundle/main.thor", "spec/fixtures/doc/%file_name%.rb.tt", "spec/fixtures/doc/COMMENTER", "spec/fixtures/doc/README", "spec/fixtures/doc/block_helper.rb", "spec/fixtures/doc/components/.empty_directory", "spec/fixtures/doc/config.rb", "spec/fixtures/doc/config.yaml.tt", "spec/fixtures/enum.thor", "spec/fixtures/group.thor", "spec/fixtures/invoke.thor", "spec/fixtures/path with spaces", "spec/fixtures/preserve/script.sh", "spec/fixtures/script.thor", "spec/fixtures/task.thor", "spec/group_spec.rb", "spec/invocation_spec.rb", "spec/parser/argument_spec.rb", "spec/parser/arguments_spec.rb", "spec/parser/option_spec.rb", "spec/parser/options_spec.rb", "spec/rake_compat_spec.rb", "spec/register_spec.rb", "spec/runner_spec.rb", "spec/shell/basic_spec.rb", "spec/shell/color_spec.rb", "spec/shell/html_spec.rb", "spec/shell_spec.rb", "spec/spec_helper.rb", "spec/task_spec.rb", "spec/thor_spec.rb", "spec/util_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
