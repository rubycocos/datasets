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

end # class TestFootballDataset
