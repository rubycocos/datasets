# encoding: utf-8

module Datafile


###
##  check/todo: ename to BatchBuilder, MultiBuilder,etc - find better name - why, why not??

class BuilderEx

  def self.load_file( path )
    code = File.read_utf8( path )
    self.load( code )
  end

  def self.load( code )
    builder = BuilderEx.new
    builder.instance_eval( code )
    builder
  end


  include LogUtils::Logging

  def initialize
    @datafiles = []
    @datafile = nil
  end

  attr_reader :datafiles


  def data( arg )

    logger.info( "[builder] add data '#{arg.inspect}' : #{arg.class.name}" )

    if arg.kind_of?( String ) || arg.kind_of?( Symbol )   # e.g. 'at' or :at
      name = arg.to_s
      ## note: always default to FileWorker for now
      ##  -- use file: true -- find better name e.g. worker/source: file - why? why not??
      @datafile = Datafile.new( name: name, file: true )
      yield  ### execute block in context
       ## b = Builder.new
       ## block.call( b )  ## same as b.instance_eval( &block) ???
       ## b.instance_eval( code )
       ## b = Builder.load( &block )
    elsif arg.kind_of?( Hash )  ## Hash  e.g. :at_calc => :at etc.
      key   = arg.keys.first
      ### todo: add deps (from value)
      value = arg[key]   ## todo: check if single value? always turn into array
      name = key.to_s   ## get first key (assume it's name)
      @datafile = Datafile.new( name: name, file: true )  ## note: always default to FileWorker for now
      yield   ### execute block in context
      ## to be done
    else
      ## fix: report error: unknown type
    end

    @datafiles << @datafile
  end


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

end # class Builder2
end # module Datafile
