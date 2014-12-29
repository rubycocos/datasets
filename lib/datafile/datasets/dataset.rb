# encoding: utf-8

module Datafile

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

end  # class Dataset

end # module Datafile
