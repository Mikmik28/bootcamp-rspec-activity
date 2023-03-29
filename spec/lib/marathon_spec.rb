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
      it "shows a message" do
        expect(subject.create_log(duration: 10, distance: 8)).to eql("Duration: 10 hour/s, Distance: 8 km/s.")
      end
    end
  end

  # 2. describe "#count_logs"
  describe "#count_logs" do
    context "when logged twice" do
      before do
        2.times do
          subject.create_log(duration: 10, distance: 8)
        end
      end

      it "returns 2" do
        expect(subject.count_logs).to eql 2
      end
    end
  end

  # 3 describe total_duration
  describe "#total_duration" do
    context "when logged twice" do
      before do
        2.times do
          subject.create_log(duration: 10, distance: 8)
        end
      end

      it "returns a duration of 20" do
        expect(subject.total_duration).to eql 20
      end
    end
  end

  # 5 describe total_distance
  describe "#total_distance" do
    context "when logged twice" do
      before do
        2.times do
          subject.create_log(duration: 10, distance: 8)
        end
      end

      it "returns a duration of 16" do
        expect(subject.total_distance).to eql 16
      end
    end
  end
end


