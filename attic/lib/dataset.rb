
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
