# encoding: utf-8

module Datafile

class FileDatasetRegistry
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

    @roots[:footballcsv]  = '..'
  end

  def merge( hash )
    ## todo: add support for merging project mappings too
    ##   use merge_roots and merge_projects ?? why, why not??
    @roots = @roots.merge( hash )
  end

  def lookup( name )
    path, _ = lookup_worker    ## note: ignore error message passed along in return
    path
  end

  def lookup!( name )
    path, error = lookup_worker
    raise error  if error
    path
  end

private
  def lookup_worker( name )
    ## split name in org/user + project (e.g. openfootball/at-austria)
    parts = name.split( '/' )
    ## check/todo: assert parts == 2 -- why, why not??
    root = @roots[ parts[0].to_sym ]
    if root.nil?
      msg = "no mapping found for '#{parts[0]}' in '#{name}'"
      logger.error( msg )
      return [nil, DatasetNotFoundError.new( msg )]   ## throw exception FileNotFound / DatasetNotFound ??
    end

    path = "#{root}/#{parts[1]}"
    ## check if folder/directory exists
    unless File.exist?( path )
      msg = "no file found for '#{name}'; expected '#{path}'"
      logger.error( msg )
      return [nil, DatasetNotFoundError.new( msg )]   ## throw exception FileNotFound / DatasetNotFound ??
    end

    ### check for File.directory?( path ) too - why, why not???
    [path, nil]
  end
end  # class FileDatasetRegistry

end # module Datafile
