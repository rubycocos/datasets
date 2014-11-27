# encoding: utf-8

module Datafile

class FootballDataset < Dataset

  def initialize( name, opts={} )
    super( name, opts )
  end

  def read()
    logger.info( "read football-dataset '#{@name}', '#{setup}'" )

    SportDb.read_setup_from_zip( local_zip_name(), setup(), local_zip_root() )
  end
end  # class FootballDataset

end # module Datafile
