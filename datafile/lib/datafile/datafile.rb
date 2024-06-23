
module Datafile


class Datafile

  ## convenience method - use like Datafile.load_file()
  def self.load_file( path='./Datafile' )
    code = File.open( path, 'r:utf-8' ) { |f| f.read }
    self.load( code )
  end

  ## another convenience method - use like Datafile.load()
  def self.load( code )
    builder = Builder.new
    builder.instance_eval( code )

    # Note: return datafile (of course, NOT the builder)
    #  if you want a builder use Datafile::Builder ;-)
    datafile = builder.datafile
    datafile
  end


  include LogUtils::Logging


  def initialize( opts={} )
    @opts     = opts
    @datasets = []

    @worker = if opts[:file]
                FileWorker.new( self )
              else   ## default to zip worker for now
                ZipWorker.new( self )
              end
  end

  attr_reader :datasets


  def worker=( value )  # lets you change worker - find a better way - how, why, why not??
    @worker =  if value.is_a?( Class )   ## let's you pass in FileWorker or ZipWorker etc.
                 value.new( self )
               elsif value.to_sym == :file
                 FileWorker.new( self )
               elsif value.to_sym == :zip
                 ZipWorker.new( self )
               else
                 value
               end
  end


  def run
    logger.info( "[datafile] begin - run" )
    download     # step 1 - download zips for datasets
    read         # step 2 - read in datasets from zips  - note: includes running inlines
    logger.info( "[datafile] end - run" )
  end


  def download
    logger.info( "[datafile] dowload" )
    @worker.download
    ## check: use @worker.download( @datasets) - why, why not??  link worker w/ datafile - why, why not??
  end

  def read
    logger.info( "[datafile] read" )
    @worker.read
  end

  def dump
    ## for debugging dump datasets (note: will/might also check if zip exits)
    logger.info( "[datafile] dump datasets (for debugging)" )
    @worker.dump
  end

end # class Datafile
end # module Datafile
