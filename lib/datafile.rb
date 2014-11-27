

require 'logutils'


# our own code

require 'datafile/version'  # let it always go first



module Datafile

  def self.banner
    "datafile/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end  

end  # module Datafile



puts Datafile.banner    # say hello

