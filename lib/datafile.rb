# encoding: utf-8

require 'logutils'


# our own code

require 'datafile/version'  # let it always go first

require 'datafile/datasets/dataset'
require 'datafile/datasets/football'
require 'datafile/datasets/beer'
require 'datafile/datasets/world'
require 'datafile/datafile'
require 'datafile/builder'


# say hello
puts Datafile.banner    if $DEBUG || (defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG)
