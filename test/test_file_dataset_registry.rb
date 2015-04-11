# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_file_dataset_registry.rb


require 'helper'

class TestFileDatasetRegistry < MiniTest::Test

  def test_lookup
    registry = Datafile::FileDatasetRegistry.new
    registry.merge( openfootball: '../../openfootball' )

    assert_equal '../../openfootball/at-austria', registry.lookup( 'openfootball/at-austria')
    assert_equal '../../openmundi/world.db',      registry.lookup( 'openmundi/world.db' )

    assert_equal '../../openfootball/at-austria', registry.lookup!( 'openfootball/at-austria')
    assert_equal '../../openmundi/world.db',      registry.lookup!( 'openmundi/world.db' )

    assert_equal '../../openfootball/national-teams', registry.lookup( 'openfootball/national-teams')
    assert_equal '../../openfootball/euro-cup',       registry.lookup( 'openfootball/euro-cup' )
  end

end # class TestFileDatasetRegistry

