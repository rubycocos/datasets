# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_dataset_file_registry.rb


require 'helper'

class TestDatasetFileRegistry < MiniTest::Test

  def test_lookup
    registry = Datafile::DatasetFileRegistry.new
    registry.merge( openfootball: '../../openfootball' )

    assert_equal '../../openfootball/at-austria', registry.lookup( 'openfootball/at-austria')
    assert_equal '../../openmundi/world.db',      registry.lookup( 'openmundi/world.db' )

    assert_equal '../../openfootball/at-austria', registry.lookup!( 'openfootball/at-austria')
    assert_equal '../../openmundi/world.db',      registry.lookup!( 'openmundi/world.db' )
  end

end # class TestDatasetFileRegistry
