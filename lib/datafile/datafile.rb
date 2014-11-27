# encoding: utf-8

module Datafile

class Datafile

  include LogUtils::Logging

  attr_reader :datasets

  def initialize()
    @datasets = []
  end


  def run()
    logger.info( "[datafile] begin - run" )
    download()   # step 1 - download zips for datasets
    read()       # step 2 - read in datasets from zips
    logger.info( "[datafile] end - run" )
  end

  def download()
    logger.info( "[datafile] dowload" )
    @datasets.each do |dataset|
      dataset.download()
    end
  end

  def read()
    logger.info( "[datafile] read" )
    @datasets.each do |dataset|
      dataset.read()
    end
  end

end # class Datafile
end # module Datafile

