# encoding: utf-8


############
# fix: move global method to ??

def read_known_datasets( path )
    ary = []
    lines = File.open( path, 'r:utf-8' ).read
    lines.each_line do |line|
      ## skip blank and comments lines
      next   if /^\s*#/ =~ line || /^\s*$/ =~ line

      ary << line.strip
    end
    ary
end


module Datafile

class Dataset
  include LogUtils::Logging

  def initialize( name, opts={} )
    @name = name
    @opts = opts
  end

  attr_reader :name, :opts

  ## convenience helpers for known opts
  def setup()   @opts[:setup];           end    ## note: return nil if not found/set
  def format()  @opts[:format] || 'txt'; end    ## note: assume default is txt (other formats incl. csv) for now - why? wh not?


  def file?                    # note: use file? (not exit? might use zip? later to check if zip exists? -why? why not?)
    ## hack/convenience shortcut:
    ##   1) check if dataset exists as local (in situ) file dataset
    ##    e.g. working folder  == name of dataset
    ##
    ##   todo/fix: 2) also check
    ##                   via (file)registry - why, why not??

    ## split name in org/user + project (e.g. openfootball/at-austria)
    parts = @name.split( '/' )

    basename = parts[1]
    ##  e.g.
    ##  ./ (working folder) => at-austria
    ##  openfootball/at-austria
    if File.basename( Dir.getwd ) == basename
      puts "  bingo!! working folder >#{basename}< matches dataset"
      true     ## return true
    else
      false    ## return false
    end
  end  ## file?

end # class Dataset



class WorldDataset < Dataset
  def initialize( name_easy, opts={} )

    ## check if name include slash (e.g. /)
    ##  - if not auto-add openmundi/ (default)
    if name_easy.index( '/' ).nil?
      name = "openmundi/#{name_easy}"
    else
      name = name_easy   ## just pass through for now
    end

    super( name, opts )  ## todo/check: just juse super (e.g. pass along all params - why? why not?)
  end
end  # class WorldDataset



class FootballDataset < Dataset

  def self.build_known_datasets
    read_known_datasets( "#{::Datafile.data_path}/football.txt" )
  end

  def self.known_datasets
    @@known_football_datasets ||= build_known_datasets
    @@known_football_datasets
  end


  def initialize( name_easy, opts={} )

    ## check if name include slash (e.g. /)
    ##  - if not auto-add openfootball/ (default)
    if name_easy.index( '/' ).nil?
      if opts[:format] == 'csv'
        name = "footballcsv/#{name_easy}"
      else
        name = "openfootball/#{name_easy}"
      end
    else
      name = name_easy   ## just pass through for now
    end

    super( name, opts )

    ### check for known datasets; warn: if not known (might be a typo)
    unless self.class.known_datasets.include?( name )
      ## todo: use logger - why, why not??
      puts "*** warn: unknown football dataset '#{name}', typo ???"
    end
  end
end # class FootballDataset


class BeerDataset < Dataset
  def initialize( name_easy, opts={} )

    ## check if name include slash (e.g. /)
    ##  - if not auto-add openbeer/ (default)
    if name_easy.index( '/' ).nil?
      name = "openbeer/#{name_easy}"
    else
      name = name_easy   ## just pass through for now
    end

    super( name, opts )
  end
end  # class BeerDataset


end # module Datafile
