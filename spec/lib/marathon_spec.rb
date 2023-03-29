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
      it "displays the correct message when logging a duration of 10 hrs and distance of 8 km" do
        expect { subject.create_log(duration: 10, distance: 8) }.to output("Duration: 10 hour/s, Distance: 8 km/s.\n").to_stdout
      end
    end
  end

  # 2. describe "#count_logs"
  describe "#count_logs" do
    context "when there are no logs" do
      it "returns 0" do
        expect(subject.count_logs).to eq 0
      end
    end

    context "when there are logs" do
      before do
        3.times do
          subject.create_log(duration: rand(10), distance: rand(8))
        end
      end

      it "returns the correct count" do
        expect(subject.count_logs).to eq 3
      end
    end
  end
end
