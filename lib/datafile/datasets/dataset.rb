# encoding: utf-8

module Datafile

  class Error < StandardError
  end

####
# todo/check:
# rename to DatasetNotFound or similar??
# use "common" error class - why? why not?
  class DatasetNotFoundError < Error
    attr_reader :message

    def initialize( message )
      @message = message
    end

    def to_s
      "datset not found => #{@message}"
    end
  end


class Dataset
  include LogUtils::Logging

  def initialize( name, opts={} )
    @name = name
    @opts = opts
  end

  def setup
    value = @opts[:setup] || 'all'
    "setups/#{value}"
  end
end # class Dataset


class DatasetFileRegistry
##  store mapping for (local) datasets e.g.
##   map github handle e.g. openfootball/at-austria to local path

  include LogUtils::Logging

  def initialize
    ## org rootpaths
    @roots = {}
    ## org defaults (use merge to overwrite for now)
    @roots[:openmundi]    = '../../openmundi'   ## OPENMUNDI_ROOT    = "../../openmundi"
    @roots[:openfootball] = '..'                ## OPENFOOTBALL_ROOT = ".."
    @roots[:openbeer]     = '..'
  end

  def merge( hash )
    ## todo: add support for merging project mappings too
    ##   use merge_roots and merge_projects ?? why, why not??

    @roots = @roots.merge( hash )
  end

  def lookup( name ) lookup_worker( name, false ); end  ## false=>return nil; do NOT fail w/ excep
  def lookup!(name ) lookup_worker( name, true ); end  ## true=>throw except;

private
  def lookup_worker( name, fail_on_error )
    ### fix: use lookup! version for exption and lookup (w/ returning nil) - why, why not??

    ## split name in org/user + project (e.g. openfootball/at-austria)
    parts = name.split( '/' )
    ## check/todo: assert parts == 2 -- why, why not??
    root = @roots[ parts[0].to_sym ]
    if root.nil?
      msg = "no mapping found for '#{parts[0]}' in '#{name}'"
      logger.error( msg )
      if fail_on_error
        raise DatasetNotFoundError.new( msg )  ## throw exception FileNotFound / DatasetNotFound ??
      else
        return nil
      end
    end

    path = "#{root}/#{parts[1]}"
    ## check if folder/directory exists
    unless File.exists?( path )
      msg = "no file found for '#{name}'; expected '#{path}'"
      logger.error( msg )
      if fail_on_error
        raise DatasetNotFoundError.new( msg )  ## throw exception FileNotFound / DatasetNotFound ??
      else
        return nil
      end     
    end
    ### check for File.directory?( path ) too - why, why not???
    path
  end

end  # class DatasetFileRegistry


class DatasetFile < Dataset     ## check: use(rename to) FileDataset - why, why not??
  ## read dataset from file(system)

  @@registry = nil

  def self.registry
    ## use ||=  why, why not??  - add Registry as nested class, why, why not ??
    if @@registry.nil?
      @@registry = DatasetFileRegistry.new
    end
    @@registry
  end

  def initialize( name, opts={} )
    super( name, opts )
  end


  def dump
    ## for debuggin dump dataset  -- todo (also check if folder exits ??)
    puts "dataset '#{@name}' opts=#{@opts.to_json}"     ## use opts.inspect instead of to_json - why? why not?
  end
end # class DatasetFile



class DatasetZip < Dataset   ## check: use(rename to) ZipDataset - why, why not??
  ## read dataset from zip(archive)

  def initialize( name, opts={} )
    super( name, opts )
  end

  def remote_zip_url  # remote zip url
    ###  note: use http:// for now - lets us use (personal proxy NOT working w/ https) for now
    ## "https://github.com/#{@name}/archive/master.zip"
    "http://github.com/#{@name}/archive/master.zip"
  end

  def local_zip_name
    ### note: replace / in name w/ --I--
    ##  e.g. flatten the filename, that is, do NOT include any folders
    @name.gsub('/', '--I--')   # note: will NOT include/return .zip extension
  end

  def local_zip_root
    "./tmp"
  end

  def local_zip_path  # local zip path
    "#{local_zip_root}/#{local_zip_name}.zip"
  end


  def download
    logger.info( "download dataset '#{@name}'" )
    logger.info( "   from '#{remote_zip_url}'" )
    logger.info( "   to '#{local_zip_path}'..." )

    download_blob( remote_zip_url, local_zip_path )
  end


  def dump
    ## for debuggin dump dataset (also check if zip exits)
    puts "dataset '#{@name}' opts=#{@opts.to_json}"     ## use opts.inspect instead of to_json - why? why not?
    puts "  local '#{local_zip_name}' (#{local_zip_path})"
    if File.exist?( local_zip_path )
      puts "    size: #{File.size(local_zip_path)} bytes"
    else
      puts "    (file not found)"
    end
    puts "  remote '#{remote_zip_url}'"
  end


private
  ####
  # download tasks for zips
  def download_blob( url, dest )
    logger.info "downloading #{url} to #{dest}..."

    ## make sure dest path exists
    dest_p = File.dirname( dest )
    FileUtils.mkdir_p( dest_p )  unless File.exists?( dest_p )   ## use Dir.exists?? why? why not??

    worker = Fetcher::Worker.new
    worker.copy( url, dest )
    ## print some file stats
    logger.debug "  size: #{File.size(dest)} bytes"
  end

end  # class DatasetZip

end # module Datafile
