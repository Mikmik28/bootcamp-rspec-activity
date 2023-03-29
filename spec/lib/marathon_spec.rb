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
        result = "Duration: #{expected[:duration]} hour/s, Distance: #{expected[:distance]} km/s."
        expected_message = "Duration: 10 hour/s, Distance: 8 km/s."
        expect(subject.logs).to include(expected_message)
      
      end

      # 1. create a spec when user create a log with a 
      # duration of 10 and distance of 8, and should shows a message:
      # "Duration: 10 hour/s, Distance: 8 km/s."
    end
  end

  #2. describe "#count_logs"
  describe "#count_logs" do
    context "when logging the total count " do
      before do
        3.times do
          subject.create_log(duration: 10, distance: 8)
        end
      end

      it "should count the total logs" do
        expect(subject.logs.count).to eq 3
        subject.count_logs
      end
    end
   end

  #3. describe "#total_duration"
   describe "#total_duration" do
    context "when returning the total duration" do
      let(:expected) { { duration: 10, distance: 8 } }
   
      before do
        3.times do
          subject.create_log( duration: 10, distance: 8)
        end
      end

      it "should count the total duration" do
        total = subject.logs.count * expected[:duration]
        expect(total).to eq 30
        puts  "Total Duration: #{total} hour/s"
      end
    end
  end

  #5. describe "#total_distance"
  describe "#total_distance" do
    context "when returning the total distance" do
      let(:expected) { { duration: 10, distance: 8 } }
  
      before do
        3.times do
          subject.create_log( duration: 10, distance: 8)
        end
      end

      it "should count the total distance" do
        total = subject.logs.count * expected[:distance]
        expect(total).to eq 24
        puts  "Total Distance: #{total} km/s."
      end
    end
  end

end


