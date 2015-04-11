# encoding: utf-8

module Datafile

class Dataset
  include LogUtils::Logging

  def initialize( name, opts={} )
    @name = name
    @opts = opts
  end

  attr_reader :name
  attr_reader :opts

  def setup
    value = @opts[:setup] || 'all'
    "setups/#{value}"
  end
end # class Dataset


class WorldDataset < Dataset
  def initialize( name, opts={} )
    super( name, opts )  ## todo/check: just juse super (e.g. pass along all params - why? why not?)
  end
  
  def zip_worker()   WorldZipDataset.new( self );  end   ## check: change (rename) just use zip or use worker_zip?? - why, why not?
  def file_worker()  WorldFileDataset.new( self ); end
end  # class WorldDataset

class FootballDataset < Dataset
  def initialize( name, opts={} )
    super( name, opts )
  end

  def zip_worker()   FootballZipDataset.new( self );  end
  def file_worker()  FootballFileDataset.new( self ); end
end # class FootballDataset

class BeerDataset < Dataset
  def initialize( name, opts={} )
    super( name, opts )
  end

  def zip_worker()   BeerZipDataset.new( self );  end
  def file_worker()  BeerFileDataset.new( self ); end
end  # class BeerDataset


end # module Datafile
