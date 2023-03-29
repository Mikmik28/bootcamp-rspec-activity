# RSpec activity
___
If you want run your spec, run this to your terminal:
```
rspec spec/
```

## Activity
1. create a spec when user create a log with a duration of 10 and distance of 8, it shows a message:
"Duration: 10 hour/s, Distance: 8 km/s."

2. describe "#count_logs"
- create a logs as much as you want
- it should count the total logs

## Bonus Challenge!!!

3. describe "#total_duration"
  - create a logs as much as you want
  - it should return the total duration

4. "total_duration" seems to be not working properly. Investigate and fix the error.
  - go to the file `lib/marathon_logs.rb`
  - fix the method called `tota_duration`

5. describe "#total_distance"
  - create a logs as much as you want
  - it should return the total distance

6. after creating a spec for "#total_distance", in `lib/marathon_logs.rb`, sum all the total distance of the logs
