# encoding: utf-8

module Datafile

class FootballFileDataset < DatasetFile

  def initialize( name, opts={} )
    super( name, opts )
  end

  def read()
    logger.info( "read football-dataset (file) '#{@name}', '#{setup}'" )

    ## SportDb.read_setup( ?? setup() ?? )
  end
end # class FootballFileDataset


class FootballZipDataset < DatasetZip

  def initialize( name, opts={} )
    super( name, opts )
  end

  def read()
    logger.info( "read football-dataset (zip) '#{@name}', '#{setup}'" )

    SportDb.read_setup_from_zip( local_zip_name(), setup(), local_zip_root() )
  end
end  # class FootballZipDataset

end # module Datafile
