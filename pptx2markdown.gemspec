require File.join [File.dirname(__FILE__), 'lib', 'pptx2markdown', 'version.rb']

Gem::Specification.new do |spec|
  spec.name = 'pptx2markdown'
  spec.version = Pptx2markdown::VERSION
  spec.licenses = ['MIT']
  spec.author = 'Artem Filatov'
  spec.email = 'bind.disney@gmail.com'
  spec.homepage = 'https://github.com/bind-disney/pptx2markdown'
  spec.platform = Gem::Platform::RUBY
  spec.summary = 'PPTX to Markdown converter'
  spec.files = `git ls-files`.split("
")
  spec.require_paths << 'lib'
  spec.has_rdoc = false
  spec.bindir = 'bin'

  spec.executables << 'pptx2markdown'

  spec.add_development_dependency 'pry', '~> 0.10', '>= 0.10.3'
  spec.add_development_dependency 'pry-doc', '~> 0.8', '>= 0.8.0'
  spec.add_development_dependency 'pry-byebug', '~> 3.3', '>= 3.3.0'
  spec.add_development_dependency 'rubocop', '~> 0.40', '>= 0.40.0'

  spec.add_runtime_dependency 'gli', '~> 2.13', '>= 2.13.4'
  spec.add_runtime_dependency 'powerpoint', '1.8'
  spec.add_runtime_dependency 'rubyzip', '~> 1.1', '>= 1.1.2'
  spec.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.7.2'
  spec.add_runtime_dependency 'openxml-package', '~> 0.2.4'
end
