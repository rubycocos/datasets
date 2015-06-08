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
    ## note: also run inlines (setup script) before
    @datafile.inlines.each do |inline|
      inline.call
    end

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
    ## also dump inlines
    @datafile.inlines.each do |inline|
      inline.dump
    end
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
