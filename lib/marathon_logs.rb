class MarathonLogs
  attr_reader :logs

  def initialize
    @logs = []
  end

  # duration attribute is by hour
  # distance attribute is by km
  def create_log(duration:, distance:)
    logs << { duration: duration, distance: distance }
    "Duration: #{duration} hour/s, Distance: #{distance} km/s."
  end

  def count_logs
    logs.count
  end

  # 4 debugging
  def total_duration
    logs.reduce(0) { |total, log| total + log[:duration] }
  end

  # 6 defining total_distance
  def total_distance
    logs.reduce(0) { |total, log| total + log[:distance] }
  end
end
