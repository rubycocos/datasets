###
#  to run use
#     ruby test/test_football_dataset.rb


require_relative  'helper'

class TestFootballDataset < Minitest::Test

  def test_names
    pp FootballDataset.known_datasets

    at   = FootballDataset.new( 'austria' )
    at2  = FootballDataset.new( 'openfootball/austria' )
    xxx  = FootballDataset.new( 'xxx' )
    xxx2 = FootballDataset.new( 'openfootball/xxx' )

    assert_equal 'openfootball/austria', at.name
    assert_equal 'openfootball/austria', at2.name

    assert_equal 'openfootball/xxx', xxx.name
    assert_equal 'openfootball/xxx', xxx2.name

    ## check csv format
    at   = FootballDataset.new( 'austria', format: 'csv' )
    at2  = FootballDataset.new( 'footballcsv/austria' )

    assert_equal 'footballcsv/austria', at.name
    assert_equal 'footballcsv/austria', at2.name
  end

  ## move to test datasets - why, why not ??
  def test_world
    at   = WorldDataset.new( 'austria.db' )
    at2  = WorldDataset.new( 'openmundi/austria.db' )
    xxx  = WorldDataset.new( 'xxx' )
    xxx2 = WorldDataset.new( 'openmundi/xxx' )

    assert_equal 'openmundi/austria.db', at.name
    assert_equal 'openmundi/austria.db', at2.name

    assert_equal 'openmundi/xxx', xxx.name
    assert_equal 'openmundi/xxx', xxx2.name
  end

  def test_beer
    at   = BeerDataset.new( 'austria' )
    at2  = BeerDataset.new( 'openbeer/austria' )
    xxx  = BeerDataset.new( 'xxx' )
    xxx2 = BeerDataset.new( 'openbeer/xxx' )

    assert_equal 'openbeer/austria', at.name
    assert_equal 'openbeer/austria', at2.name

    assert_equal 'openbeer/xxx', xxx.name
    assert_equal 'openbeer/xxx', xxx2.name
  end

end # class TestFootballDataset
