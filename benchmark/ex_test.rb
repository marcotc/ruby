
# ./configure -C --disable-install-doc --disable-tk --with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --prefix=/Users/marco.costa/.rbenv/versions/ruby-test \
#               CC=clang \
#               CFLAGS='-O3 -g' \
#               LDFLAGS='-Wl,-no_pie' \
#               LIBS=-lprofiler
#
# ./configure --prefix=/Users/aaron/.rbenv/versions/ruby-trunk \
#               --disable-install-rdoc \
#               --disable-tk \
#               --with-readline-dir=/usr/local/opt/readline \
#               CC=clang \
#               CFLAGS='-O3 -g' \
#               LDFLAGS='-Wl,-no_pie' \
#               LIBS=-lprofiler

class Test
  def root
    raise 'root cause'
  end

  def wrapper
    root
  rescue
    raise 'wrapper layer'
  end

  def call
    wrapper
  rescue => e
    e
  end
end

ex = Test.new.call

# puts ex.custom_full_message(highlight: false, order: :top)
# puts ex.full_message(highlight: false, order: :top)

for _i in 1..3000000 do
  ex.custom_full_message(highlight: false, order: :top)
end


#~/.../public/ruby faster-full-message≠ $ make test
# 	BASERUBY = /Users/marco.costa/.rbenv/shims/ruby --disable=gems
# 	CC = clang
# 	LD = clang
# 	LDSHARED = clang -dynamiclib
# 	CFLAGS = -O3 -g -fdeclspec -O3 -fno-fast-math -ggdb3 -Wall -Wextra -Werror=deprecated-declarations -Werror=division-by-zero -Werror=implicit-function-declaration -Werror=implicit-int -Werror=misleading-indentation -Werror=pointer-arith -Werror=shorten-64-to-32 -Werror=write-strings -Wmissing-noreturn -Wno-constant-logical-operand -Wno-long-long -Wno-missing-field-initializers -Wno-overlength-strings -Wno-parentheses-equality -Wno-self-assign -Wno-tautological-compare -Wno-unused-parameter -Wno-unused-value -Wunused-variable -Werror=extra-tokens -Werror=undef -std=gnu99 -pipe
# 	XCFLAGS = -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fno-strict-overflow -DRUBY_DEVEL=1 -fvisibility=hidden -DRUBY_EXPORT -fPIE -I. -I.ext/include/x86_64-darwin19 -I./include -I. -I./enc/unicode/12.1.0
# 	CPPFLAGS = -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE -D_DARWIN_UNLIMITED_SELECT -D_REENTRANT
# 	DLDFLAGS = -Wl,-no_pie -Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress -fstack-protector-strong -Wl,-pie -framework CoreFoundation
# 	SOLIBS = -lpthread -lgmp -ldl -lobjc -lprofiler
# 	LANG = en_CA.UTF-8
# 	LC_ALL =
# 	LC_CTYPE =
# 	MFLAGS =
# Apple clang version 12.0.0 (clang-1200.0.32.28)
# Target: x86_64-apple-darwin19.6.0
# Thread model: posix
# InstalledDir: /Library/Developer/CommandLineTools/usr/bin
# Fiber count: 10000 (skipping)
# PASS all 1488 tests
# exec ./miniruby -I./lib -I. -I.ext/common  ./tool/runruby.rb --extout=.ext  -- --disable-gems "./bootstraptest/runner.rb" --ruby="ruby --disable-gems"   ./KNOWNBUGS.rb
# 2021-05-31 16:49:50 -0700
# Driver is ruby 3.1.0dev (2021-05-31T18:43:38Z faster-full-message 29b7db2e7c) [x86_64-darwin19]
# Target is ruby 3.1.0dev (2021-05-31T18:43:38Z faster-full-message 29b7db2e7c) [x86_64-darwin19]
# last_commit=fixup! Faster Exception#full_message
#
# KNOWNBUGS.rb  PASS 0
# No tests, no problem
#
# test succeeded
# ~/.../public/ruby faster-full-message≠ $ make check
# 	BASERUBY = /Users/marco.costa/.rbenv/shims/ruby --disable=gems
# 	CC = clang
# 	LD = clang
# 	LDSHARED = clang -dynamiclib
# 	CFLAGS = -O3 -g -fdeclspec -O3 -fno-fast-math -ggdb3 -Wall -Wextra -Werror=deprecated-declarations -Werror=division-by-zero -Werror=implicit-function-declaration -Werror=implicit-int -Werror=misleading-indentation -Werror=pointer-arith -Werror=shorten-64-to-32 -Werror=write-strings -Wmissing-noreturn -Wno-constant-logical-operand -Wno-long-long -Wno-missing-field-initializers -Wno-overlength-strings -Wno-parentheses-equality -Wno-self-assign -Wno-tautological-compare -Wno-unused-parameter -Wno-unused-value -Wunused-variable -Werror=extra-tokens -Werror=undef -std=gnu99 -pipe
# 	XCFLAGS = -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fno-strict-overflow -DRUBY_DEVEL=1 -fvisibility=hidden -DRUBY_EXPORT -fPIE -I. -I.ext/include/x86_64-darwin19 -I./include -I. -I./enc/unicode/12.1.0
# 	CPPFLAGS = -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE -D_DARWIN_UNLIMITED_SELECT -D_REENTRANT
# 	DLDFLAGS = -Wl,-no_pie -Wl,-undefined,dynamic_lookup -Wl,-multiply_defined,suppress -fstack-protector-strong -Wl,-pie -framework CoreFoundation
# 	SOLIBS = -lpthread -lgmp -ldl -lobjc -lprofiler
# 	LANG = en_CA.UTF-8
# 	LC_ALL =
# 	LC_CTYPE =
# 	MFLAGS =
# Apple clang version 12.0.0 (clang-1200.0.32.28)
# Target: x86_64-apple-darwin19.6.0
# Thread model: posix
# InstalledDir: /Library/Developer/CommandLineTools/usr/bin
# ./revision.h unchanged
# generating encdb.h
# encdb.h unchanged
# generating enc.mk
# making srcs under enc
# make[1]: Nothing to be done for `srcs'.
# generating transdb.h
# transdb.h unchanged
# generating makefiles ext/configure-ext.mk
# ext/configure-ext.mk unchanged
# make[2]: `ruby' is up to date.
# make[1]: Nothing to be done for `note'.
# making enc
# make[1]: Nothing to be done for `enc'.
# making trans
# make[1]: Nothing to be done for `./enc/trans'.
# making encs
# make[1]: Nothing to be done for `encs'.
# Fiber count: 10000 (skipping)
# PASS all 1488 tests
# exec ./miniruby -I./lib -I. -I.ext/common  ./tool/runruby.rb --extout=.ext  -- --disable-gems "./bootstraptest/runner.rb" --ruby="ruby --disable-gems"   ./KNOWNBUGS.rb
# 2021-05-31 16:52:01 -0700
# Driver is ruby 3.1.0dev (2021-05-31T18:43:38Z faster-full-message 29b7db2e7c) [x86_64-darwin19]
# Target is ruby 3.1.0dev (2021-05-31T18:43:38Z faster-full-message 29b7db2e7c) [x86_64-darwin19]
# last_commit=fixup! Faster Exception#full_message
#
# KNOWNBUGS.rb  PASS 0
# No tests, no problem
#
# test succeeded
# Run options:
#   --seed=64754
#   "--ruby=./miniruby -I./lib -I. -I.ext/common  ./tool/runruby.rb --extout=.ext  -- --disable-gems"
#
# # Running tests:
#
# Finished tests in 6.583599s, 47.8462 tests/s, 253.6606 assertions/s.
# 315 tests, 1670 assertions, 0 failures, 0 errors, 0 skips
#
# ruby -v: ruby 3.1.0dev (2021-05-31T18:43:38Z faster-full-message 29b7db2e7c) [x86_64-darwin19]
# Skipping Gem::PackageTask tests.  rake not found.
# Run options:
#   --seed=20957
#   "--ruby=./miniruby -I./lib -I. -I.ext/common  ./tool/runruby.rb --extout=.ext  -- --disable-gems"
#   --excludes-dir=./test/excludes
#   --name=!/memory_leak/
#
# # Running tests:
#
# [ 7333/20786] TestException#test_full_message = 0.00 s
#   1) Failure:
# TestException#test_full_message [/Users/marco.costa/work/public/ruby/test/ruby/test_exception.rb:1260]:
# Expected "" to be end_with? "\n".
#
# [ 8816/20786] TestGem#test_use_gemdeps_automatic_missingCould not find ast-2.4.2 in any of the sources
# You may need to `gem install -g` to install missing gems
#
# [ 8827/20786] TestGemBundlerVersionFinder#test_bundler_version_defaults_to_nil = 0.02 s
#   2) Failure:
# TestGemBundlerVersionFinder#test_bundler_version_defaults_to_nil [/Users/marco.costa/work/public/ruby/test/rubygems/test_gem_bundler_version_finder.rb:27]:
# Expected Gem::Version.new("2.1.4") to be nil.
#
# [ 8828/20786] TestGemBundlerVersionFinder#test_bundler_version_with_bundle_update_bundler = 0.02 s
#   3) Failure:
# TestGemBundlerVersionFinder#test_bundler_version_with_bundle_update_bundler [/Users/marco.costa/work/public/ruby/test/rubygems/test_gem_bundler_version_finder.rb:37]:
# Expected Gem::Version.new("2.1.4") to be nil.
#
# [ 8831/20786] TestGemBundlerVersionFinder#test_bundler_version_with_reason = 0.02 s
#   4) Failure:
# TestGemBundlerVersionFinder#test_bundler_version_with_reason [/Users/marco.costa/work/public/ruby/test/rubygems/test_gem_bundler_version_finder.rb:65]:
# Expected ["2.1.4", "your /Users/marco.costa/work/public/Gemfile.lock"] to be nil.
#
# [ 8832/20786] TestGemBundlerVersionFinder#test_compatible = 0.02 s
#   5) Failure:
# TestGemBundlerVersionFinder#test_compatible [/Users/marco.costa/work/public/ruby/test/rubygems/test_gem_bundler_version_finder.rb:100]:
# Failed assertion, no message given.
#
# [ 8833/20786] TestGemBundlerVersionFinder#test_deleted_directory = 0.02 s
#   6) Failure:
# TestGemBundlerVersionFinder#test_deleted_directory [/Users/marco.costa/work/public/ruby/test/rubygems/test_gem_bundler_version_finder.rb:95]:
# Expected ["2.1.4", "your /Users/marco.costa/work/public/Gemfile.lock"] to be nil.
#
# [ 8834/20786] TestGemBundlerVersionFinder#test_filter = 0.01 s
#   7) Failure:
# TestGemBundlerVersionFinder#test_filter [/Users/marco.costa/work/public/ruby/test/rubygems/test_gem_bundler_version_finder.rb:124]:
# <["1", "1.0", "1.0.1.1", "2", "2.a", "2.0", "2.1.1", "3", "3.a", "3.0", "3.1.1"]> expected but was
# <["2", "2.a", "2.0", "2.1.1"]>.
#
# [ 9370/20786] TestGemDependency#test_to_specs_respects_bundler_version = 0.02 s
#   8) Failure:
# TestGemDependency#test_to_specs_respects_bundler_version [/Users/marco.costa/work/public/ruby/test/rubygems/test_gem_dependency.rb:353]:
# <[Gem::Specification.new do |s|
#    s.name = "bundler"
#    s.version = Gem::Version.new("2.0.0.pre.1")
#    s.installed_by_version = Gem::Version.new("3.3.0.dev")
#    s.authors = ["A User"]
#    s.date = Time.utc(2021, 5, 31)
#    s.description = "This is a test description"
#    s.email = "example@example.com"
#    s.homepage = "http://example.com"
#    s.require_paths = ["lib"]
#    s.required_rubygems_version = Gem::Requirement.new(["> 1.3.1"])
#    s.rubygems_version = "3.3.0.dev"
#    s.specification_version = 4
#    s.summary = "this is a summary"
#    end,
#  Gem::Specification.new do |s|
#    s.name = "bundler"
#    s.version = Gem::Version.new("1")
#    s.installed_by_version = Gem::Version.new("3.3.0.dev")
#    s.authors = ["A User"]
#    s.date = Time.utc(2021, 5, 31)
#    s.description = "This is a test description"
#    s.email = "example@example.com"
#    s.homepage = "http://example.com"
#    s.require_paths = ["lib"]
#    s.rubygems_version = "3.3.0.dev"
#    s.specification_version = 4
#    s.summary = "this is a summary"
#    end]> expected but was
# <[Gem::Specification.new do |s|
#    s.name = "bundler"
#    s.version = Gem::Version.new("2.0.0.pre.1")
#    s.installed_by_version = Gem::Version.new("3.3.0.dev")
#    s.authors = ["A User"]
#    s.date = Time.utc(2021, 5, 31)
#    s.description = "This is a test description"
#    s.email = "example@example.com"
#    s.homepage = "http://example.com"
#    s.require_paths = ["lib"]
#    s.required_rubygems_version = Gem::Requirement.new(["> 1.3.1"])
#    s.rubygems_version = "3.3.0.dev"
#    s.specification_version = 4
#    s.summary = "this is a summary"
#    end]>.
#
# [11616/20786] TestIRB::TestContext#test_eval_input_with_exception = 0.01 s
#   9) Failure:
# TestIRB::TestContext#test_eval_input_with_exception [/Users/marco.costa/work/public/ruby/test/irb/test_context.rb:475]:
# Expected /\(irb\):1:in `fuga': unhandled exception\n/
# to match
#   "(irb):1:in `fuga':  (RuntimeError)\n"+
#   "\tfrom (irb):1:in `hoge'\n"+
#   "\tfrom (irb):1:in `<main>'\n"
# after 1 patterns with 0 characters.
#
# [11618/20786] TestIRB::TestContext#test_eval_input_with_long_exception = 0.01 s
#  10) Failure:
# TestIRB::TestContext#test_eval_input_with_long_exception [/Users/marco.costa/work/public/ruby/test/irb/test_context.rb:571]:
# Expected /\(irb\):1:in `a20': unhandled exception\n/
# to match
#   "(irb):1:in `a20':  (RuntimeError)\n"+
#   "\tfrom (irb):1:in `a19'\n"+
#   "\tfrom (irb):1:in `a18'\n"+
#   "\tfrom (irb):1:in `a17'\n"+
#   "\tfrom (irb):1:in `a16'\n"+
#   "\tfrom (irb):1:in `a15'\n"+
#   "\tfrom (irb):1:in `a14'\n"+
#   "\tfrom (irb):1:in `a13'\n"+
#   "\tfrom (irb):1:in `a12'\n"+
#   "\tfrom (irb):1:in `a11'\n"+
#   "\tfrom (irb):1:in `a10'\n"+
#   "\tfrom (irb):1:in `a9'\n"+
#   "\tfrom (irb):1:in `a8'\n"+
#   "\tfrom (irb):1:in `a7'\n"+
#   "\tfrom (irb):1:in `a6'\n"+
#   "\tfrom (irb):1:in `a5'\n"+
#   "\tfrom (irb):1:in `a4'\n"+
#   "\t... 5 levels...\n"
# after 1 patterns with 0 characters.
#
# [12047/20786] TestKernel#test_gem_bundler = 0.08 s
#  11) Failure:
# TestKernel#test_gem_bundler [/Users/marco.costa/work/public/ruby/test/rubygems/test_kernel.rb:115]:
# Failed assertion, no message given.
#
# Finished tests in 661.115825s, 31.4287 tests/s, 4044.8888 assertions/s.
# 20778 tests, 2674140 assertions, 11 failures, 0 errors, 43 skips
#
# ruby -v: ruby 3.1.0dev (2021-05-31T18:43:38Z faster-full-message 29b7db2e7c) [x86_64-darwin19]
# make: *** [yes-test-all] Error 11
# ~/.../public/ruby faster-full-message≠ $
