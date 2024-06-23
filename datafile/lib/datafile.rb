require 'logutils'
require 'fetcher'    ## add (HTTP/S) download support (of blobs/binaries/zips)


# our own code
require_relative 'datafile/version'  # let it always go first



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


require_relative 'datafile/dataset'
require_relative 'datafile/builder'


require_relative 'datafile/workers/file/registry'
require_relative 'datafile/workers/file/dataset'
require_relative 'datafile/workers/file/worker'

require_relative 'datafile/workers/zip/dataset'
require_relative 'datafile/workers/zip/worker'

require_relative 'datafile/datafile'


# say hello
puts Datafile.banner    ##  if defined?($RUBYCOCO_DEBUG) && $RUBYCOCO_DEBUG
