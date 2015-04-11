# encoding: utf-8

module Datafile

class Datafile

  include LogUtils::Logging


  ## convenience method - use like Datafile.load_file()
  def self.load_file( path='./Datafile' )
    code = File.read_utf8( path )
    self.load( code )
  end

  ## another convenience method - use like Datafile.load()
  def self.load( code )
    builder = Builder.new
    builder.instance_eval( code )

    # Note: return datafile (of course, NOT the builder)
    #  if you want a builder use Datafile::Builder ;-)
    builder.datafile   
  end


  def initialize
    @datasets = []

    @worker   = ZipWorker.new( self )   ## default to zip worker for now
  end

  attr_reader   :datasets
  attr_accessor :worker      # lets you change worker - find a better way - how, why, why not??


  def run
    logger.info( "[datafile] begin - run" )
    download     # step 1 - download zips for datasets
    read         # step 2 - read in datasets from zips
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


=begin
  def download_world   ## only dl world datasets (skip all others)
    logger.info( "[datafile] dowload world datasets" )
    @datasets.each do |dataset|
      if dataset.kind_of? WorldDataset
        dataset.download()
      else
        # skip all others
      end
    end
  end

  def download_beer   ## only dl beer datasets (skip all others)
    logger.info( "[datafile] dowload beer datasets" )
    @datasets.each do |dataset|
      if dataset.kind_of? BeerDataset
        dataset.download()
      else
        # skip all others
      end
    end
  end

  def download_football   ## only dl football datasets (skip all others)
    logger.info( "[datafile] dowload football datasets" )
    @datasets.each do |dataset|
      if dataset.kind_of? FootballDataset
        dataset.download()
      else
        # skip all others
      end
    end
  end
=end


=begin
  def read_world
    logger.info( "[datafile] read world datasets" )
    @datasets.each do |dataset|
      if dataset.kind_of?( WorldDataset )
        dataset.read()
      else
        # skip all others
      end
    end
  end

  def read_beer
    logger.info( "[datafile] read beer datasets" )
    @datasets.each do |dataset|
      if dataset.kind_of?( BeerDataset )
        dataset.read()
      else
        # skip all others
      end
    end
  end

  def read_football
    logger.info( "[datafile] read football datasets" )
    @datasets.each do |dataset|
      if dataset.kind_of?( FootballDataset )
        dataset.read()
      else
        # skip all others
      end
    end
  end
=end

end # class Datafile
end # module Datafile

