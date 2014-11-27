# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_builder.rb


require 'helper'

class TestBuilder < MiniTest::Test

  def test_builder
    code =<<EOS
## comments

  world  'openmundi/world.db', setup: 'countries'

  football 'openfootball/national-teams'      ## NOTE: default is setup: 'all'
  
  ### todo/fix: download archive only once(!!) even if included more than once
  ## football 'openfootball/world-cup', setup: '2014_quali'

  football 'openfootball/world-cup', setup: '2014'

## more comments

EOS

    builder = Datafile::Builder.load( code )
    
    datafile = builder.datafile
    ## datafile.run
    ## datafile.download
    ## datafile.read

    assert true  # if we get here - test success
  end

end # class TestBuilder
