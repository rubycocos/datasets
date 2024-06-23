###
#  to run use
#     ruby test/test_builder.rb


require_relative  'helper'

class TestBuilder < Minitest::Test

  def test_builder
    code =<<TXT
## comments

  world  'world.db', setup: 'countries'

  football 'national-teams'      ## NOTE: default is setup: 'all

  ### todo/fix: download archive only once(!!) even if included more than once
  ## football 'world-cup', setup: '2014_quali'

  football 'world-cup', setup: '2014'

## more comments

TXT

    builder = Datafile::Builder.load( code )

    datafile = builder.datafile
    ## datafile.run

    datafile.download
    ## datafile.read
    datafile.dump

    ## change worker (defaults to ZipWorker)
    datafile.worker = Datafile::FileWorker
    datafile.dump

    assert true  # if we get here - test success
  end

end # class TestBuilder
