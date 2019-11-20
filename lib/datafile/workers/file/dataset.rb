# encoding: utf-8

module Datafile

class FileDataset
  ## read dataset from file(system)

  include LogUtils::Logging


  def self.registry
    @@registry ||= FileDatasetRegistry.new
    @@registry
  end

  def initialize( dataset )
    @dataset = dataset
  end

  def repo_dir     ### check: use (rename to) include dir (or local_repo_dir) - why, why not ???
    ## note: for easy testing allow "in situ" datasets
    ##   e.g.  ./ (e.g. mu-mauritius)  is openfootball/mu-mauritius
    ## split name in org/user + project (e.g. openfootball/at-austria)
    parts = @dataset.name.split( '/' )

    basename = parts[1]
    if File.basename( Dir.getwd ) == basename
      puts "  bingo!! working folder >#{basename}< matches dataset"
      return Dir.getwd     ## assume working directory/folder is repo dir
    end

    registry.lookup( @dataset.name )
  end

  def dump
    ## for debuggin dump dataset  -- todo (also check if folder exits ??)
    puts "dataset '#{@dataset.name}' opts=#{@dataset.opts.inspect}"     ## use opts.inspect instead of to_json - why? why not?
    puts "  repo-dir '#{repo_dir}'"
  end

  def read
    if @dataset.is_a?( FootballDataset )
      logger.info( "read football dataset (file) '#{@dataset.name}', '#{@dataset.setup}'" )

      ## pack = SportDb::DirPackage.new( repo_dir )
      ## pack.read( season: @dataset.setup )   ##  note: pass on (optional) setup arg as season (filter) arg for now
    else
      logger.info( "TODO/FIX: read dataset (file) '#{@dataset.name}', '#{@dataset.setup}'; sorry" )
    end
  end


private
  def registry()  self.class.registry;  end    ## convenience method to access "static" shared class variable
end # class FileDataset
end # module Datafile
