# encoding: utf-8

module Datafile

class Error < StandardError
end

####
# todo/check:
# rename to DatasetNotFound or similar??
# use "common" error class - why? why not?
class DatasetNotFoundError < Error
  attr_reader :message

  def initialize( message )
    @message = message
  end

  def to_s
    "datset not found => #{@message}"
  end
end


class DatasetNode     ### find a better name (e.g. DatasetWorker, DatasetBase, DatasetRef, DatasetWrapper ???) ???

  include LogUtils::Logging

  def initialize( dataset )
    @dataset = dataset
  end

  def name()   @dataset.name;  end    ## delegate attributes to "core" dataset struct
  def opts()   @dataset.opts;  end
  def setup()  @dataset.setup; end
  def format() @dataset.format; end

end # class DatasetNode


end # module Datafile
