# encoding: utf-8

require 'logutils'


# our own code
require 'datafile/version'  # let it always go first


module Datafile

  class Error < StandardError
  end

  ####
  # todo/check:
  # rename to DatasetNotFound or similar??
  # use "common" error class - why? why not?
  class DatasetNotFoundError < Error
    attr_reader :message

    def initialize( message )
      @message = message
    end

    def to_s
      "datset not found => #{@message}"
    end
  end
end   # module Datafile


require 'datafile/dataset'
require 'datafile/builder'


require 'datafile/workers/file/registry'
require 'datafile/workers/file/dataset'
require 'datafile/workers/file/worker'

require 'datafile/workers/zip/dataset'
require 'datafile/workers/zip/worker'

require 'datafile/datafile'


# say hello
puts Datafile.banner    if defined?($RUBYCOCO_DEBUG) && $RUBYCOCO_DEBUG
