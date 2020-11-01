


class DatasetNode     ### find a better name (e.g. DatasetWorker, DatasetBase, DatasetRef, DatasetWrapper ???) ???


  def initialize( dataset )
    @dataset = dataset
  end

  def name()   @dataset.name;  end    ## delegate attributes to "core" dataset struct
  def opts()   @dataset.opts;  end
  def setup()  @dataset.setup; end
  def format() @dataset.format; end

end # class DatasetNode

