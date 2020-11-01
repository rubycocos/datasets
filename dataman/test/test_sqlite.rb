# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_sqlite.rb


require 'helper'

class TestSqlite < MiniTest::Test

  def test_connect
    m = Dataman::Dataman.new( adapter: 'sqlite3', database: ':memory:' )
    m.connect

    assert true  # if we get here - test success
  end

  def test_clean
    ## to be done
    assert true  # if we get here - test success
  end

end # class TestSqlite
