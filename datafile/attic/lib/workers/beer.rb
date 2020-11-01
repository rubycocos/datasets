# encoding: utf-8

module Datafile

class BeerFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read()
    logger.info( "read beer-dataset (file) '#{name}', '#{setup}'" )

    ## BeerDb.read_setup( setup, repo_dir )
    puts "FIX/TODO - read beer dataset -- to be (re)done, sorry!!!"
  end
end # class BeerFileDataset


class BeerZipDataset < ZipDataset

  def initialize( dataset )
    super( dataset )
  end

  def read
    logger.info( "read beer-dataset (zip) '#{name}', '#{setup}'" )

    ## BeerDb.read_setup_from_zip( local_zip_name, setup, local_zip_root )
  end
end  # class BeerZipDataset

end # module Datafile
