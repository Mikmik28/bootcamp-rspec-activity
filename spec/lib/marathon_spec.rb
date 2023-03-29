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
      it "logs expected string" do
        expect(subject.create_log(duration: 10, distance: 8)).to include('Duration: 10 hour/s, Distance: 8 km/s.')
      end
    end
  end

  # 2. describe "#count_logs"
  describe "#count_log" do
    logs_created = 3

    context "when creating the sample set of logs" do
      before do
        logs_created.times do
          subject.create_log(duration: rand(10), distance: rand(10))
        end
      end

      it "should return the amount of logs created" do
        expect(subject.count_logs).to eq logs_created
      end

    end
  end

  describe "#total_duration" do
    context "when creating the a set of logs" do
      #create a static set of logs to easily enumarate total duration (13)
      before do
        subject.create_log(duration: 3, distance: rand(10))
        subject.create_log(duration: 4, distance: rand(10))
        subject.create_log(duration: 5, distance: rand(10))
        subject.create_log(duration: 1, distance: rand(10))
      end

      it "should return the total duration of 13" do
        expect(subject.total_duration).to eq 13
      end
    end
  end

  describe "#total_distance" do
    context "when creating the a set of logs" do
      #create a static set of logs to easily enumarate total distance (9)
      before do
        subject.create_log(duration: rand(10), distance: 3)
        subject.create_log(duration: rand(10), distance: 1)
        subject.create_log(duration: rand(10), distance: 5)
      end

      it "should return the total distance of 9" do
        expect(subject.total_distance).to eq 9
      end
    end
  end

end


