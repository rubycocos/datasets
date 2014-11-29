# encoding: utf-8

module Datafile

class BeerDataset < Dataset

  def initialize( name, opts={} )
    super( name, opts )
  end

  def read()
    logger.info( "read beer-dataset '#{@name}', '#{setup}'" )

    BeerDb.read_setup_from_zip( local_zip_name(), setup(), local_zip_root() )
  end
end  # class BeerDataset

end # module Datafile
