
def repo_dir     ### check: use (rename to) include dir (or local_repo_dir) - why, why not ???
  ## note: for easy testing allow "in situ" datasets
  ##   e.g.  ./ (e.g. mu-mauritius)  is openfootball/mu-mauritius
  ## split name in org/user + project (e.g. openfootball/at-austria)
  parts = @dataset.name.split( '/' )

  basename = parts[1]
  if File.basename( Dir.getwd ) == basename
    puts "  bingo!! working folder >#{basename}< matches dataset"
    return Dir.getwd     ## assume working directory/folder is repo dir
  end

  registry.lookup( @dataset.name )
end



private
  def registry()  self.class.registry;  end    ## convenience method to access "static" shared class variable
