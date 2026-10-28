# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weeler/version'

Gem::Specification.new do |spec|
  spec.name          = 'weeler'
  spec.version       = Weeler::VERSION::STRING
  spec.authors       = ['Artūrs Braučs', 'Artis Raugulis']
  spec.email         = ['arturs.braucs@gmail.com', 'artis@devart.lv']
  spec.description   = 'CMS for devart.lv projects.'
  spec.summary       = 'CMS for devart.lv projects.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files = Dir.chdir(__dir__) do
    if File.exist?('.git')
      IO.popen(['git', 'ls-files', '-z'], &:read).split("\0")
    else
      Dir.glob('{app,config,lib}/**/*').select { |path| File.file?(path) }
    end
  end
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.2.0'

  spec.add_dependency 'i18n'
  spec.add_dependency 'rails', '>= 7.2', '< 9'
  spec.add_dependency 'rails-settings-cached', '~> 2.9'

  spec.add_dependency 'haml'
  spec.add_dependency 'jquery-ui-rails'
  spec.add_dependency 'kaminari'

  spec.add_dependency 'caxlsx', '~> 4.4'
  spec.add_dependency 'redis'
  spec.add_dependency 'roo'
  spec.add_dependency 'rubyzip'
  spec.add_dependency 'globalize'

  spec.add_development_dependency 'bundler', '>= 2.6'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'factory_girl_rails'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'webrat'
  if RUBY_PLATFORM == 'java'
    spec.add_development_dependency 'activerecord-jdbcpostgresql-adapter'
  else
    spec.add_development_dependency 'pg', '~> 1'
  end
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'rails-controller-testing'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'shoulda-matchers'
end
