# encoding: utf-8

module Datafile

class FileDataset < DatasetNode
  ## read dataset from file(system)

  def self.registry
    @@registry ||= FileDatasetRegistry.new
    @@registry
  end

  def initialize( dataset )
    super( dataset )
  end

  def repo_dir     ### check: use (rename to) include dir (or local_repo_dir) - why, why not ???
    ## note: for easy testing allow "in situ" datasets
    ##   e.g.  ./ (e.g. mu-mauritius)  is openfootball/mu-mauritius
    ## split name in org/user + project (e.g. openfootball/at-austria)
    parts = name.split( '/' )

    basename = parts[1]
    if File.basename( Dir.getwd ) == basename
      puts "  bingo!! working folder >#{basename}< matches dataset"
      return Dir.getwd     ## assume working directory/folder is repo dir
    end

    registry.lookup( name )
  end

  def dump
    ## for debuggin dump dataset  -- todo (also check if folder exits ??)
    puts "dataset '#{name}' opts=#{opts.to_json}"     ## use opts.inspect instead of to_json - why? why not?
    puts "  repo-dir '#{repo_dir}'"
  end

private
  def registry()  self.class.registry;  end    ## convenience method to access "static" shared class variable
end # class FileDataset



class FootballFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read
    logger.info( "read football-dataset (file) '#{name}', '#{setup}'" )

    pack = SportDb::Package.new( repo_dir )
    pack.read( season: setup )   ##  note: pass on (optional) setup arg as season (filter) arg for now
  end
end # class FootballFileDataset


class WorldFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read
    logger.info( "read world-dataset (file) '#{name}', '#{setup}'" )

    ## WorldDb.read_setup( 'setups/countries', WORLD_DB_INCLUDE_PATH, skip_tags: true )
    ## WorldDb.read_setup( setup, repo_dir, skip_tags: true  )
    puts "FIX/TODO - read world dataset -- to be (re)done, sorry!!!"
  end
end # class WorldFileDataset

class BeerFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read()
    logger.info( "read beer-dataset (file) '#{name}', '#{setup}'" )

    ## BeerDb.read_setup( setup, repo_dir )
    puts "FIX/TODO - read beer dataset -- to be (re)done, sorry!!!"
  end
end # class BeerFileDataset


end # module Datafile
