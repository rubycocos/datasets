###
#  to run use
#     ruby test/test_file_dataset_registry.rb


require_relative 'helper'

class TestFileDatasetRegistry < Minitest::Test

  def test_lookup
    registry = Datafile::FileDatasetRegistry.new
    registry.merge( openfootball: '../../../openfootball' )

    assert_equal '../../../openfootball/austria',    registry.lookup( 'openfootball/austria')
    assert_equal '../../../openmundi/world.db',      registry.lookup( 'openmundi/world.db' )

    assert_equal '../../../openfootball/austria',    registry.lookup!( 'openfootball/austria')
    assert_equal '../../../openmundi/world.db',      registry.lookup!( 'openmundi/world.db' )

    assert_equal '../../../openfootball/national-teams', registry.lookup( 'openfootball/national-teams')
    assert_equal '../../../openfootball/euro-cup',       registry.lookup( 'openfootball/euro-cup' )
  end

end # class TestFileDatasetRegistry
