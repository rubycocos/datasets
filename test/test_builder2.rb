# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_builder2.rb


require 'helper'

class TestBuilder2 < MiniTest::Test

  def test_builder

    builder = Datafile::BuilderEx.load_file( "#{Datafile.root}/test/datafile2/at.rb" )

    registry = Datafile::FileDataset.registry
    registry.merge( openfootball: '../../openfootball' )

    datafiles = builder.datafiles
    datafiles.each do |datafile|
      puts "=== datafile '#{datafile.name}':"
      datafile.dump
    end

    assert true  # if we get here - test success
  end

end # class TestBuilder2
