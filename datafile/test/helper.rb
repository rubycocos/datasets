
## minitest setup
require 'minitest/autorun'

## deps

### require 'worlddb'
require 'sportdb/models'   # note: will include worlddb
require 'sportdb/readers'    ## pulls in SportDb::ZipPackage or SportDb::DirPackage



$LOAD_PATH.unshift(  './lib' )

## our own code
require 'datafile'
