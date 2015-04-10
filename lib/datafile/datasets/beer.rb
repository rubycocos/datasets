# encoding: utf-8

module Datafile


class BeerZipDataset < DatasetZip

  def initialize( name, opts={} )
    super( name, opts )
  end

  def read()
    logger.info( "read beer-dataset (zip) '#{@name}', '#{setup}'" )

    BeerDb.read_setup_from_zip( local_zip_name(), setup(), local_zip_root() )
  end
end  # class BeerZipDataset

end # module Datafile
