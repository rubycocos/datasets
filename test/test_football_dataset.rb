# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_football_dataset.rb


require 'helper'

class TestFootballDataset < MiniTest::Test

  def test_names
    pp Datafile::FootballDataset.known_datasets

    at   = Datafile::FootballDataset.new( 'at-austria' )
    at2  = Datafile::FootballDataset.new( 'openfootball/at-austria' )
    xxx  = Datafile::FootballDataset.new( 'xxx' )
    xxx2 = Datafile::FootballDataset.new( 'openfootball/xxx' )

    assert_equal 'openfootball/at-austria', at.name
    assert_equal 'openfootball/at-austria', at2.name

    assert_equal 'openfootball/xxx', xxx.name
    assert_equal 'openfootball/xxx', xxx2.name
  end

  ## move to test datasets - why, why not ??
  def test_world
    at   = Datafile::WorldDataset.new( 'austria.db' )
    at2  = Datafile::WorldDataset.new( 'openmundi/austria.db' )
    xxx  = Datafile::WorldDataset.new( 'xxx' )
    xxx2 = Datafile::WorldDataset.new( 'openmundi/xxx' )

    assert_equal 'openmundi/austria.db', at.name
    assert_equal 'openmundi/austria.db', at2.name

    assert_equal 'openmundi/xxx', xxx.name
    assert_equal 'openmundi/xxx', xxx2.name
  end

  def test_beer
    at   = Datafile::BeerDataset.new( 'at-austria' )
    at2  = Datafile::BeerDataset.new( 'openbeer/at-austria' )
    xxx  = Datafile::BeerDataset.new( 'xxx' )
    xxx2 = Datafile::BeerDataset.new( 'openbeer/xxx' )

    assert_equal 'openbeer/at-austria', at.name
    assert_equal 'openbeer/at-austria', at2.name

    assert_equal 'openbeer/xxx', xxx.name
    assert_equal 'openbeer/xxx', xxx2.name
  end

end # class TestFootballDataset
