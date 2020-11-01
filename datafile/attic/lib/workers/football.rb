# encoding: utf-8

module Datafile

class FootballFileDataset < FileDataset

  def initialize( dataset )
    super( dataset )
  end

  def read
    logger.info( "read football-dataset (file) '#{name}', '#{setup}'" )

    pack = SportDb::Package.new( repo_dir )
    pack.read( season: setup )   ##  note: pass on (optional) setup arg as season (filter) arg for now
  end
end # class FootballFileDataset


class FootballZipDataset < ZipDataset

  def initialize( dataset )
    super( dataset )
  end

  def read
    logger.info( "read football-dataset (zip) '#{name}', '#{setup}'" )

    ## SportDb.read_setup_from_zip( local_zip_name, setup, local_zip_root )
  end
end  # class FootballZipDataset

end # module Datafile
