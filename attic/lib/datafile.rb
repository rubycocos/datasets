
class Script
  include LogUtils::Logging

  def initialize( proc )
    @proc = proc
  end

  def call
    logger.info( "[script] calling calc block" )
    @proc.call
  end

  def dump
    puts "  script: #{@proc.inspect}"
  end
end  ## class Script



### todo/check: use Script for Inline too?? - why, why not???
###  - use setup/pre/before and post/after or something??
##  - note: for now always is pre/before

class Inline
  include LogUtils::Logging

  def initialize( proc )
    @proc = proc
  end

  def call
    logger.info( "[inline] calling script block" )
    @proc.call
  end

  def dump
    puts "  script: #{@proc.inspect}"
  end
end  ## class Inline


class Datafile

  attr_reader   :scripts    ## calc(ulation) scripts (calc blocks)
  attr_reader   :inlines    ## inline script blocks  -- use before?? run before datasets
  attr_reader   :name
  attr_reader   :deps       ## dep(endencies)

  def initialize( opts={} )
    @scripts  = []   ## calculation scripts (calc blocks)
    @inlines  = []   ## inline (setup) scripts (run before reading datasets)

    ## (target)name - return nil if noname (set/defined/assigned)
    @name  = opts[:name] || nil
    ## deps (dependencies) - note: always returns an array (empty array if no deps)
    @deps  = opts[:deps] || []
  end

  def run
    logger.info( "[datafile] begin - run" )
    download     # step 1 - download zips for datasets
    read         # step 2 - read in datasets from zips  - note: includes running inlines
    calc         # step 3 - run calc(ulations) scripts
    logger.info( "[datafile] end - run" )
  end

  def calc
    logger.info( "[datafile] calc" )
    @worker.calc
  end

end
