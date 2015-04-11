# encoding: utf-8

module Datafile

class FileDataset < DatasetNode
  ## read dataset from file(system)

  @@registry = nil

  def self.registry
    ## use ||=  why, why not??  - add Registry as nested class, why, why not ??
    if @@registry.nil?
      @@registry = FileDatasetRegistry.new
    end
    @@registry
  end

  def initialize( dataset )
    super( dataset )
  end


  def dump
    ## for debuggin dump dataset  -- todo (also check if folder exits ??)
    puts "dataset '#{name}' opts=#{opts.to_json}"     ## use opts.inspect instead of to_json - why? why not?
  end
end # class FileDataset


class FootballFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read()
    logger.info( "read football-dataset (file) '#{name}', '#{setup}'" )

    ## SportDb.read_setup( ?? setup() ?? )
  end
end # class FootballFileDataset


class WorldFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read()
    logger.info( "read world-dataset (file) '#{name}', '#{setup}'" )

    ## SportDb.read_setup( ?? setup() ?? )
  end
end # class WorldFileDataset

class BeerFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read()
    logger.info( "read beer-dataset (file) '#{name}', '#{setup}'" )

    ## SportDb.read_setup( ?? setup() ?? )
  end
end # class BeerFileDataset


end # module Datafile
