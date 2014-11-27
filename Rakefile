require 'hoe'
require './lib/datafile/version.rb'

Hoe.spec 'datafile' do

  self.version = Datafile::VERSION

  self.summary = 'datafile - builder for downloading n reading datasets'
  self.description = summary

  self.urls    = ['https://github.com/rubylibs/datafile']

  self.author  = 'Gerald Bauer'
  self.email   = 'opensport@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'HISTORY.md'

  self.extra_deps = [
    ['logutils'],
    ['textutils'],
    ['fetcher'],
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
   :required_ruby_version => '>= 1.9.2'
  }
end
