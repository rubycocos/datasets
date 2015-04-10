# encoding: utf-8

module Datafile

class Builder

  include LogUtils::Logging

  attr_reader :datafile

  def initialize()
    @datafile = Datafile.new
  end

  def self.load_file( path )
    code = File.read_utf8( path )
    self.load( code )
  end

  def self.load( code )
    builder = Builder.new
    builder.instance_eval( code )
    builder
  end


  def beer( name, opts={} )
    logger.info( "[builder] add beer-dataset (zip) '#{name}'" )
    @datafile.datasets << BeerZipDataset.new( name, opts )
  end

  def football( name, opts={} )
    logger.info( "[builder] add football-dataset (zip) '#{name}'" )
    @datafile.datasets << FootballZipDataset.new( name, opts )
  end

  def world( name, opts={} )
    logger.info( "[builder] add world-dataset (zip) '#{name}'" )
    @datafile.datasets << WorldZipDataset.new( name, opts )
  end

end # class Builder
end # module Datafile
