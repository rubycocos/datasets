# encoding: utf-8

module Datafile

class WorldFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read
    logger.info( "read world-dataset (file) '#{name}', '#{setup}'" )

    ## WorldDb.read_setup( 'setups/countries', WORLD_DB_INCLUDE_PATH, skip_tags: true )
    ## WorldDb.read_setup( setup, repo_dir, skip_tags: true  )
    puts "FIX/TODO - read world dataset -- to be (re)done, sorry!!!"
  end
end # class WorldFileDataset


class WorldZipDataset < ZipDataset

  def initialize( dataset )
    super( dataset )
  end

  def read
    logger.info( "read world-dataset (zip) '#{name}', '#{setup}'" )

    ## WorldDb.read_setup_from_zip( local_zip_name, setup, local_zip_root, { skip_tags: true } )
  end
end  # class WorldZipDataset

end # module Datafile
