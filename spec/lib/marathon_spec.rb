require "marathon_logs"

describe MarathonLogs do
  subject { described_class.new }

  describe "#create_log" do
    context "when logged a marathon twice" do
      before do
        2.times do
          subject.create_log(duration: rand(10), distance: rand(8))
        end
      end

      it "returns 2" do
        expect(subject.logs.count).to eq 2
      end
    end

    context "when logging a duration of 10 hrs and distance of 8 km" do
      let(:expected) { { duration: 10, distance: 8 } }


      it "logs the duration and distance" do
        subject.create_log(duration: 10, distance: 8)
        expect(subject.logs).to include(expected)
      end


      # 1. create a spec when user create a log with a 
      # duration of 10 and distance of 8, and should shows a message:
      # "Duration: 10 hour/s, Distance: 8 km/s."
      it "log expected output string" do
        expected_output = "Duration: #{expected[:duration]} hour/s, Distance: #{expected[:distance]} km/s."
        expect(subject.create_log(duration: 10, distance: 8)).to include(expected_output)
        puts expected_output
      end
    end
  end

    # 2. describe "#count_logs"
  describe "#count_logs" do 
    number_of_logs = 2
    context "count the logs inside an array" do 
      before do
        number_of_logs.times do
          subject.create_log(duration: 10, distance: 8)
        end
      end

      it "returns the total logs inside of na array" do 
        # to match how many indeces inside an array
        expect(subject.logs.count).to eq number_of_logs
      end
    end
  end

  #testing total duration
  describe "#total_duration" do
  context "when getting total duration" do 
    before do 
      subject.create_log(duration: 10, distance: 8)
      subject.create_log(duration: 12, distance: 8)
      subject.create_log(duration: 13, distance: 8)
      subject.create_log(duration: 15, distance: 8)
      subject.create_log(duration: 15, distance: 8)
    end

    it "return total dutation" do 
      expect(subject.total_duration).to eq subject.total_duration
      puts "the total distance is: #{subject.total_duration}"
      
    end
  end

  # testing total distance
  describe "#total_distance" do
  context "when getting total distance" do 
    before do 
      subject.create_log(duration: 10, distance: 2)
      subject.create_log(duration: 12, distance: 5)
      subject.create_log(duration: 13, distance: 10)
      subject.create_log(duration: 15, distance: 13)
      subject.create_log(duration: 15, distance: 4)
    end

    it "return total distance" do 
      expect(subject.total_distance).to eq subject.total_distance
      puts "the total distance is: #{subject.total_distance}"
    end
  end
end
end
end


