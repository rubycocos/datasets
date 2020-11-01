# Notes


## Misc

run tests

```
[info] [builder] add world-dataset 'world.db'
[info] [builder] add football-dataset 'national-teams'
[info] [builder] add football-dataset 'world-cup'
[info] [datafile] dump datasets (for debugging)
dataset 'openmundi/world.db' opts={"setup":"countries"}
  local 'openmundi--I--world.db' (./tmp/openmundi--I--world.db.zip)
    (file not found)
  remote 'http://github.com/openmundi/world.db/archive/master.zip'
dataset 'openfootball/national-teams' opts={}
  local 'openfootball--I--national-teams' (./tmp/openfootball--I--national-teams.zip)
    (file not found)
  remote 'http://github.com/openfootball/national-teams/archive/master.zip'
dataset 'openfootball/world-cup' opts={"setup":"2014"}
  local 'openfootball--I--world-cup' (./tmp/openfootball--I--world-cup.zip)
    (file not found)
  remote 'http://github.com/openfootball/world-cup/archive/master.zip'
[info] [datafile] dump datasets (for debugging)
dataset 'openmundi/world.db' opts={"setup":"countries"}
[error] no file found for 'openmundi/world.db'; expected '../../openmundi/world.db'
  repo-dir ''
dataset 'openfootball/national-teams' opts={}
[error] no file found for 'openfootball/national-teams'; expected '../national-teams'
  repo-dir ''
dataset 'openfootball/world-cup' opts={"setup":"2014"}
[error] no file found for 'openfootball/world-cup'; expected '../world-cup'
  repo-dir ''
.

Finished in 0.010819s, 92.4314 runs/s, 92.4314 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips


[info] [builder] add world-dataset 'world.db'
[info] [builder] add football-dataset 'national-teams'
[info] [builder] add football-dataset 'world-cup'
[info] [datafile] dump datasets (for debugging)
dataset 'openmundi/world.db' opts={"setup":"countries"}
  local 'openmundi--I--world.db' (./tmp/openmundi--I--world.db.zip)
    (file not found)
  remote 'http://github.com/openmundi/world.db/archive/master.zip'
dataset 'openfootball/national-teams' opts={}
  local 'openfootball--I--national-teams' (./tmp/openfootball--I--national-teams.zip)
    (file not found)
  remote 'http://github.com/openfootball/national-teams/archive/master.zip'
dataset 'openfootball/world-cup' opts={"setup":"2014"}
  local 'openfootball--I--world-cup' (./tmp/openfootball--I--world-cup.zip)
    (file not found)
  remote 'http://github.com/openfootball/world-cup/archive/master.zip'
[info] [datafile] dump datasets (for debugging)
dataset 'openmundi/world.db' opts={:setup=>"countries"}
[error] no file found for 'openmundi/world.db'; expected '../../openmundi/world.db'
  repo-dir ''
dataset 'openfootball/national-teams' opts={}
[error] no file found for 'openfootball/national-teams'; expected '../national-teams'
  repo-dir ''
dataset 'openfootball/world-cup' opts={:setup=>"2014"}
[error] no file found for 'openfootball/world-cup'; expected '../world-cup'
  repo-dir ''
.

Finished in 0.050179s, 19.9287 runs/s, 19.9287 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```