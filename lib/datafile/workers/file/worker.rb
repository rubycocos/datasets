# encoding: utf-8

module Datafile

class FileWorker   ## check: rename to FileDatafileWorker?? or FileDatafile  -why, why not ??

  include LogUtils::Logging

  def initialize( datafile )
    @datafile = datafile
  end

  def download
    ## note: do NOTHING for now; assume repo already present (unpacked) on local filesystem
  end

  def read
    ## note: also run inlines (setup script) before
    @datafile.inlines.each do |inline|
      inline.call
    end

    @datafile.datasets.each do |dataset|
      dataset.file_worker.read
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
      dataset.file_worker.dump
    end

    ## also dump scripts
    @datafile.scripts.each do |script|
      script.dump
    end
  end

end  # class FileWorker

end # module Datafile
