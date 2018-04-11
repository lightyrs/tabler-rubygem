lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tabler/version'

Gem::Specification.new do |s|
  s.name     = 'tabler-rubygem'
  s.version  = Tabler::VERSION
  s.authors  = ['lightyrs']
  s.email    = 'harris@lightyrs.com'
  s.summary  = 'Integrates Tabler Dashboard UI Kit (built on Bootstrap 4) into Rails Asset Pipeline'
  s.homepage = 'https://github.com/lightyrs/tabler-rubygem'
  s.license  = 'MIT'

  s.add_runtime_dependency 'popper_js', '>= 1.12.9', '< 2'

  s.add_runtime_dependency 'sass', '>= 3.5.2'
  s.add_runtime_dependency 'autoprefixer-rails', '>= 6.0.3'

  # Testing dependencies
  s.add_development_dependency 'minitest', '~> 5.8.0'
  s.add_development_dependency 'minitest-reporters', '~> 1.0.5'
  s.add_development_dependency 'term-ansicolor'
  # Integration testing
  s.add_development_dependency 'capybara', '>= 2.6.0'
  s.add_development_dependency 'poltergeist'
  # Dummy Rails app dependencies
  s.add_development_dependency 'actionpack', '>= 4.1.5'
  s.add_development_dependency 'activesupport', '>= 4.1.5'
  s.add_development_dependency 'json', '>= 1.8.1'
  s.add_development_dependency 'sprockets-rails', '>= 2.3.2'
  s.add_development_dependency 'jquery-rails', '>= 3.1.0'
  s.add_development_dependency 'slim-rails'
  s.add_development_dependency 'uglifier'

  s.files      = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test/*`.split("\n")
end
