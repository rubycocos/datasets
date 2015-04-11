# encoding: utf-8

module Datafile

class WorldZipDataset < ZipDataset

  def initialize( dataset )
    super( dataset )
  end

  def read
    logger.info( "read world-dataset (zip) '#{name}', '#{setup}'" )

    WorldDb.read_setup_from_zip( local_zip_name, setup, local_zip_root, { skip_tags: true } )
  end
end  # class WorldZipDataset

end # module Datafile