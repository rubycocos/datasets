# attic note:  remove inline/script block for now  (keep it simple) - why? why not?


## add models shortcuts/constants if exist
##   todo/check: is there a better way ?
##    e.g. just include in inline section/block - for example?
##    check if already included? and check on load to include?
##     models might not yet be required

if defined?( WorldDb ) && defined?( WorldDb::Models )
  include WorldDb::Models
else
  puts "*** sorry; can't include WorldDb::Models; not yet defined (required)"
end
## todo/check: also include FootballDb::Models and BeerDb::Models ???


## "special" datasets

def inline( &block )
  logger.info( "[builder] add inline script-block" )
  @datafile.inlines << Inline.new( block )
end
