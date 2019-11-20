
class FileWorker

  def read
    ## note: also run inlines (setup script) before
    @datafile.inlines.each do |inline|
      inline.call
    end
  end

  def calc
    @datafile.scripts.each do |script|
      script.call
    end
  end

  def dump
    ## also dump inlines
    @datafile.inlines.each do |inline|
      inline.dump
    end

    ## also dump scripts
    @datafile.scripts.each do |script|
      script.dump
    end
  end
end
