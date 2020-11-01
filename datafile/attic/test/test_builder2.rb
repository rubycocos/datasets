# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_builder2.rb


require 'helper'

def recalc_standings( *args )
  puts "[eval] self in method recal_standings = #{self.class.name}"
  puts "hello from (global) recalc_standings"
end


class TestBuilder2 < MiniTest::Test

  def test_builder

    builder = Datafile::BuilderEx.load_file( "#{Datafile.root}/test/datafile2/at.rb" )

    registry = Datafile::FileDataset.registry
    registry.merge( openfootball: '../../openfootball' )

    datafiles = builder.datafiles
    datafiles.each do |datafile|
      puts "=== datafile '#{datafile.name}' => #{datafile.deps.inspect}:"
      puts "  #{datafile.datasets.size} datasets, #{datafile.scripts.size} scripts"
      datafile.dump
      datafile.calc  ## try calc (call dummy calculations for testing)
    end

    assert true  # if we get here - test success
  end

end # class TestBuilder2
