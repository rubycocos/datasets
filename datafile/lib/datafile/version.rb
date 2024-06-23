
module Datafile

  MAJOR = 0    ## todo: namespace inside version or something - why? why not??
  MINOR = 3
  PATCH = 2
  VERSION = [MAJOR,MINOR,PATCH].join('.')

  def self.version
    VERSION
  end

  def self.banner
    "datafile/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}] in (#{root})"
  end

  def self.root
    File.expand_path( File.dirname(File.dirname(File.dirname(__FILE__))) )
  end

  def self.data_path
      "#{root}/data"
  end

end  # module Datafile
