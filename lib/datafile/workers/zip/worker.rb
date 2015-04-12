# encoding: utf-8

module Datafile

class ZipWorker   ## check: rename to ZipDatafileWorker?? or ZipDatafile  -why, why not ??

  include LogUtils::Logging

  def initialize( datafile )
    @datafile = datafile
  end

  def download
    @datafile.datasets.each do |dataset|
      dataset.zip_worker.download
    end
  end

  def read
    @datafile.datasets.each do |dataset|
      dataset.zip_worker.read
    end
  end

  def calc
    @datafile.scripts.each do |script|
      script.call
    end
  end

  def dump
    @datafile.datasets.each do |dataset|
      dataset.zip_worker.dump
    end
    ## also dump scripts
    @datafile.scripts.each do |script|
      script.dump
    end
  end

end  # class ZipWorker

end # module Datafile
