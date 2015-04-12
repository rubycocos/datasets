
puts "[eval] self in top = #{self.class.name}"

task :at => :importbuiltin do
  puts "[eval] self in data (enter) = #{self.class.name}"
  football 'openfootball/at-austria'
  puts "[eval] self in data (leave) = #{self.class.name}"
end

task :at_2014_15 => :importbuiltin do
  football 'openfootball/at-austria', setup: '2014-15'
end


task :at_recalc => :at do
  calc do
    [['at.2012/13'],
     ['at.2013/14'],
     ['at.2014/15', 'at.2.2014/15']].each do |event_key|
       recalc_standings( event_key, out_root: './build/at-autria' )
    end
  end
end

task :at_2014_15_recalc => :at_2014_15 do
  calc do
    recalc_standings( ['at.2014/15', 'at.2.2014/15'], out_root: './build/at-autria' )
  end
end


task :test_at_recalc => :env  do
  calc do
    recalc_standings( ['at.2014/15', 'at.2.2014/15'], out_root: './build/at-autria' )
    ## debug verison - write to ./build/at-austria 
    ## recalc_standings( ['at.2014/15', 'at.2.2014/15'], out_root: './build/at-austria' )
  end
end


## check if method def works too

puts "[eval] another self in top = #{self.class.name}"


def test_hello()
  puts "[eval] self in method test_hello = #{self.class.name}"
  puts "hello from test_hello"  
end

test_hello()
