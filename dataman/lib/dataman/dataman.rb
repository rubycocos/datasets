# encoding: utf-8

module Dataman

class Dataman

  def initialize( config )
    @config = config   # db config connection spec hash
  end


  def clean
    db_adapter = @config[ 'adapter' ]
    
    ### for sqlite3 delete/remove single-file database
    if db_adapter == 'sqlite3'
      db_database = @config[ 'database' ]

      ## check:
      ##  if in memory e.g. ':memory:' no delete/clean needed!!!

      FileUtils.rm( db_database )   if File.exists?( db_database )
    else
      puts "[Dataman] clean: do nothing; no clean steps configured for db adapter >#{db_adapter}<"
    end
  end


  def connect
    pp @config
    ActiveRecord::Base.establish_connection( @config )

    db_adapter = @config[ 'adapter' ]
    
    ## try to speed up sqlite
    ## see http://www.sqlite.org/pragma.html
    if db_adapter == 'sqlite3'
      c = ActiveRecord::Base.connection
      
      ## check:
      ##  if in memory e.g. ':memory:' no pragma needed!!
      
      c.execute( 'PRAGMA synchronous=OFF;' )
      c.execute( 'PRAGMA journal_mode=OFF;' )
      c.execute( 'PRAGMA temp_store=MEMORY;' )
    end
  end



end # class Dataman

end   # module Dataman

