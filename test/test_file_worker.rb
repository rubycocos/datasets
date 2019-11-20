# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_file_worker.rb


require 'helper'

class TestFileWorker < MiniTest::Test

  def test_eurocup

    world_datafile = Datafile::Datafile.load_file( "#{Datafile.root}/test/datafile/world.rb" )
    world_datafile.dump

    eurocup_datafile = Datafile::Datafile.load_file( "#{Datafile.root}/test/datafile/eurocup.rb" )
    eurocup_datafile.dump

    # database setup 'n' config
    ActiveRecord::Base.establish_connection( adapter:  'sqlite3',
                                             database: ':memory:' )
    SportDb.create_all

    ## change worker (defaults to ZipWorker)
    world_datafile.worker = Datafile::FileWorker.new( world_datafile )
    world_datafile.dump
##    world_datafile.read

    registry = Datafile::FileDataset.registry
    registry.merge( openfootball: '../../openfootball' )

    eurocup_datafile.worker = Datafile::FileWorker.new( eurocup_datafile )
    eurocup_datafile.dump
##    eurocup_datafile.read

    assert true  # if we get here - test success
  end

end # class TestFileWorker
