
module Datafile


class ZipDataset   ### use (rename to) ZipDatasetWorker/Helper/Wrapper/Fetcher/Downloader - why, why not ???
  ## read dataset from zip(archive)

  include LogUtils::Logging

  def initialize( dataset )
    @dataset = dataset
  end

  def remote_zip_url  # remote zip url
    "https://github.com/#{@dataset.name}/archive/master.zip"
  end

  def local_zip_name
    ### note: replace / in name w/ --I--
    ##  e.g. flatten the filename, that is, do NOT include any folders
    @dataset.name.gsub('/', '--I--')   # note: will NOT include/return .zip extension
  end

  def local_zip_root
    "./tmp"
  end

  def local_zip_path  # local zip path
    "#{local_zip_root}/#{local_zip_name}.zip"
  end


  def download
    logger.info( "download dataset '#{@dataset.name}'" )
    logger.info( "   from '#{remote_zip_url}'" )
    logger.info( "   to '#{local_zip_path}'..." )

    download_blob( remote_zip_url, local_zip_path )
  end


  def dump
    ## for debuggin dump dataset (also check if zip exits)
    puts "dataset '#{@dataset.name}' opts=#{@dataset.opts.to_json}"     ## use opts.inspect instead of to_json - why? why not?
    puts "  local '#{local_zip_name}' (#{local_zip_path})"
    if File.exist?( local_zip_path )
      puts "    size: #{File.size(local_zip_path)} bytes"
    else
      puts "    (file not found)"
    end
    puts "  remote '#{remote_zip_url}'"
  end

  def read
    if @dataset.is_a?( FootballDataset )
      logger.info( "read football dataset (zip) '#{@dataset.name}', '#{@dataset.setup}'" )

      pack = SportDb::ZipPackage.new( local_zip_path )
      pack.read( season: @dataset.setup )   ##  note: pass on (optional) setup arg as season (filter) arg for now
    else
      logger.info( "TODO/FIX: read dataset (zip) '#{@dataset.name}', '#{@dataset.setup}'; sorry" )
    end
  end


private
  ####
  # download tasks for zips
  def download_blob( url, dest )
    logger.info "downloading #{url} to #{dest}..."

    ## make sure dest path exists
    dest_p = File.dirname( dest )
    FileUtils.mkdir_p( dest_p )  unless File.exist?( dest_p )   ## use Dir.exist?? why? why not??

    worker = Fetcher::Worker.new
    worker.copy( url, dest )
    ## print some file stats
    logger.debug "  size: #{File.size(dest)} bytes"
  end

end  # class DatasetZip

end # module Datafile
