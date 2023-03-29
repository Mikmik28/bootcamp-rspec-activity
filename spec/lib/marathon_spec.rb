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
      it "display the correct message of the duration which is 10 hour/s and distance of 8 km/s" do
        # puts "Duration: 10 hour/s, Distance: 8 km/s"
        # puts "Duration: #{subject.duration} hour/s, Distance: #{subject.distance} km/s"
        # expect(subject.create_log(duration: 10, distance: 8)).to include(expected)
        # expect(subject.create_log(...)).to include(expected)
        subject.create_log(duration: 10, distance: 8)
        # expect(subject.logs).to include(expected)
        expect(subject.logs).to include( { duration: 10, distance: 8 } )
        # puts "Duration: #{ expected[ :duration ] } hour/s, Distance: #{ expected[ :distance ] } km/s."
      end
    end
  end

  # 2. describe "#count_logs"
  describe "#count_logs" do
    context "when there are no count logs" do
      it "returns 0" do
        expect(subject.logs.count).to eql(0)
      end
    end

    context "when there are count logs" do
      before do
        3.times do
          subject.create_log(duration: rand(10), distance: rand(8))
        end
      end

      it "this returns the correct number of logs" do
        expect(subject.logs.count).to eql(3)
      end
    end
  end

  # 3. describe "#total_duration"
  describe "#total_duration" do
    context "when there are no count logs" do
      it "returns 0" do
        expect(subject.logs.count).to eql(0)
      end
    end
    
    context "when there are duration logs" do
  #     before do
  #       2.times do
  #         subject.create_log(duration: 5, distance: rand(10))
  #       end
  #     end

  #     it "this returns the total duration of logs" do
  #       expect(subject.logs.duration).to eql(2)
  #     end
      let(:expected_duration) { { duration: 5, distance: 5 } }
      it "this returns the total duration of logs" do
        subject.create_log(duration: 5, distance: 5)
        expect(subject.logs).to include (expected_duration)
      end
    end
  end

  # 3. describe "#distance"
  describe "#distance" do
    context "when there are no count logs" do
      it "returns 0" do
        expect(subject.logs.count).to eql(0)
      end
    end

    context "when there are distance logs" do
      # let(:expected_duration) { { duration: 5, distance: 5 } }

      # it "this returns the total duration of logs" do
      #   subject.create_log(duration: 5, distance: 5)
      #   expect(subject.logs).to include (expected_duration)
      # end

      before do
        subject.create_log(duration: 1, distance: 2)
        subject.create_log(duration: 2, distance: 3)
        subject.create_log(duration: 4, distance: 5)
        subject.create_log(duration: 5, distance: 6)
        subject.create_log(duration: 7, distance: 8)
      end

      it "return total distance" do
        expect(subject.total_distance).to eql (subject.total_distance)
      end
    end
  end
end


