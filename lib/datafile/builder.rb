# encoding: utf-8

module Datafile

class Builder     ## "simple" builder (one file, one datafile)

  def self.load_file( path )
    code = File.read_utf8( path )
    self.load( code )
  end

  def self.load( code )
    builder = Builder.new
    builder.instance_eval( code )
    builder
  end


  include LogUtils::Logging

  ## add models shortcuts/constants if exist
  ##   todo/check: is there a better way ?
  ##    e.g. just include in inline section/block - for example?
  ##    check if already included? and check on load to include?
  ##     models might not yet be required

  if defined?( WorldDb ) && defined?( WorldDb::Models )
    include WorldDb::Models
  else
    puts "*** sorry; can't include WorldDb::Models; not yet defined (required)"
  end
  ## todo/check: also include FootballDb::Models and BeerDb::Models ???


  def initialize
    @datafile = Datafile.new
  end

  attr_reader :datafile

  ## "special" datasets

  def inline( &block )
    logger.info( "[builder] add inline script-block" )
    @datafile.inlines << Inline.new( block )
  end


  ## "classic" standard datasets

  def beer( name, opts={} )
    logger.info( "[builder] add beer-dataset '#{name}'" )
    @datafile.datasets << BeerDataset.new( name, opts )
  end

  def football( name, opts={} )
    logger.info( "[builder] add football-dataset '#{name}'" )
    @datafile.datasets << FootballDataset.new( name, opts )
  end

  def world( name, opts={} )
    logger.info( "[builder] add world-dataset '#{name}'" )
    @datafile.datasets << WorldDataset.new( name, opts )
  end

end # class Builder
end # module Datafile

