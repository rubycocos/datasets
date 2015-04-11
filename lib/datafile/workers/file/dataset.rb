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

  def repo_dir     ### check: use (rename to) include dir (or local_repo_dir) - why, why not ??? 
    registry.lookup( name )
  end

  def dump
    ## for debuggin dump dataset  -- todo (also check if folder exits ??)
    puts "dataset '#{name}' opts=#{opts.to_json}"     ## use opts.inspect instead of to_json - why? why not?
    puts "  repo-dir '#{repo_dir}'"
  end

private
  def registry    ## convenience method to access "static" shared class variable
    FileDataset.registry     ## self.registry  not working?? - or self.registry() -why, why not??
  end
end # class FileDataset



class FootballFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read()
    logger.info( "read football-dataset (file) '#{name}', '#{setup}'" )

    SportDb.read_setup( setup, repo_dir )
  end
end # class FootballFileDataset


class WorldFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read()
    logger.info( "read world-dataset (file) '#{name}', '#{setup}'" )

    ## WorldDb.read_setup( 'setups/countries', WORLD_DB_INCLUDE_PATH, skip_tags: true )
    WorldDb.read_setup( setup, repo_dir, skip_tags: true  )
  end
end # class WorldFileDataset

class BeerFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read()
    logger.info( "read beer-dataset (file) '#{name}', '#{setup}'" )

    BeerDb.read_setup( setup, repo_dir )
  end
end # class BeerFileDataset


end # module Datafile
