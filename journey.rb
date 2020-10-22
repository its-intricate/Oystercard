require 'station' , 'oystercard'
class Journey
  attr_reader:entry_station,
  def initialize (in,out) #each argument is and array
    @entry_station = Station.new(name,zone)
  end

  #@journey = {in: in , out:out }
  def finish
  end

  def fare
  end

  def complete
  end

end
