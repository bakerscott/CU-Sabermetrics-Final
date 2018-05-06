# README for rawData2010_2013_v2.csv

## GOAL:
to look at "transitions" in game state for certain players

## Data:
play-by-play data for every play that happened in MLB from 2010-2013, including playoffs

## Columns
* `GAME_DT` - data of the game in form yyyymmdd (2010 data has form 10mmdd)
* `GAME_ID` - ID for the game, has home team and data embedded
* `battingTeam` - team that the batter in the even is on
* `fieldingTeam` - team on defense
* `player` - player ID of the player; will "join" another table with these IDs to get player names. Also, the player will ALWAYS be playing for the `battingTeam` for each event
* `pitchSequence` - sequence of pitches, visit Retrosheet.org for details
* `balls` - number of balls thrown (in pitch sequence)
* `strikes` - number of strikes thrown (in pitch sequence); no difference between "looking" and "swinging"
* `EVENT_CD` - retrosheet assignment to the value of what happened for that play; same as `VALUE_CD`
* `inning` - what inning of the game the play is in
* `outs` - how many outs before the play
* `VALUE_CD` - retrosheet assignment to the value of what happened for that play; same as `EVENT_CD`
* `EVENT_TX` - string with details about exactly what happened on play; see Retrosheet.org for details
* `SHORTNAME_TX` - abbreviation of what happened; attached to `VALUE_CD`
* `LONGNAME_TX` - string of what happened in common words; attached to `VALUE_CD`
* `START_BASES_CD` - value for base configuration; connect with `sN`; start of play
* `sN` - string of the base configuration after the play
* `lN` - long name of the base configuration
* `END_BASES_CD` - value for base configuration; connect with `sN2`; end of play
* `sN2` - string of the base configuration after the play
* `lN2` - long name of the base configuration
* `outOnPlay` - number of outs the fielding team got on the play
* `runsOnPlay` - number of runs scored on the play
* `ballparkID` - redundant; ballpark ID for where they are playing; could look up what the actual park is/join park name and location is a minor detail
* `homeTeam` - redundant; three letter code for the team that is playing at home; should correspond to the first three characters of `GAME_ID`
* `homeHits` - redundant; number of hits the home team made during that game
* `homeScore` - redundant; number of runs scored by the home team during that game
* `awayTeam` - redundant; three letter code for the team that is playing on the road
* `awayHits` - redundant; number of hits the away team made during that game
* `awayScore` - redundant; number of runs scored by the away team during the game
