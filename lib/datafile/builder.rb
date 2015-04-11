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

  def initialize
    @datafile = Datafile.new
  end

  attr_reader :datafile

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

