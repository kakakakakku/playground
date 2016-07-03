require 'myo'

Myo.connect do |myo|
  myo.on :connected do
    puts "Myo connected!"
  end

  myo.on :pose do |pose, edge|
    puts "#{pose}: #{edge}"
  end

  myo.on :periodic do |orientation|
    # puts orientation.accel.x
  end
end
