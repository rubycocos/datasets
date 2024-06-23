###
#  to run use
#     ruby test/test_file_worker.rb


require_relative 'helper'

class TestFileWorker < Minitest::Test

  def test_eurocup

    world_datafile = Datafile::Datafile.load_file( "#{Datafile.root}/test/datafile/world.rb" )
    world_datafile.dump

    eurocup_datafile = Datafile::Datafile.load_file( "#{Datafile.root}/test/datafile/eurocup.rb" )
    eurocup_datafile.dump

    # database setup 'n' config
    SportDb.open_mem

    ## change worker (defaults to ZipWorker)
    world_datafile.worker = Datafile::FileWorker
    world_datafile.dump
##    world_datafile.read

    registry = Datafile::FileDataset.registry
    registry.merge( openfootball: '../../../openfootball' )

    eurocup_datafile.worker = Datafile::FileWorker
    eurocup_datafile.dump
##    eurocup_datafile.read

    assert true  # if we get here - test success
  end

end # class TestFileWorker
