

module Datafile

class ZipWorker   ## check: rename to ZipDatafileWorker?? or ZipDatafile  -why, why not ??

  include LogUtils::Logging

  def initialize( datafile )
    @datafile = datafile
  end

  def download
    @datafile.datasets.each do |dataset|
      z = ZipDataset.new( dataset )
      z.download
    end
  end

  def read
    @datafile.datasets.each do |dataset|
      z = ZipDataset.new( dataset )
      z.read
    end
  end

  def dump
    @datafile.datasets.each do |dataset|
      z = ZipDataset.new( dataset )
      z.dump
    end
  end

end  # class ZipWorker

end # module Datafile
