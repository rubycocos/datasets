# encoding: utf-8

require 'logutils'


# our own code

require 'datafile/version'  # let it always go first

require 'datafile/datasets/dataset'

require 'datafile/workers/dataset'

require 'datafile/workers/file/dataset'
require 'datafile/workers/file/registry'
require 'datafile/workers/file/worker'

require 'datafile/workers/zip/dataset'
require 'datafile/workers/zip/beer'
require 'datafile/workers/zip/football'
require 'datafile/workers/zip/world'
require 'datafile/workers/zip/worker'

require 'datafile/datafile'
require 'datafile/builder'
require 'datafile/builder2'


# say hello
puts Datafile.banner    if defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG

