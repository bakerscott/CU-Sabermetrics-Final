USE retrosheet1013;


-- main query to output as .csv: 
DROP TABLE IF EXISTS temp;
CREATE TABLE temp as 
SELECT gm.GAME_DT, eve.GAME_ID, eve.BAT_TEAM_ID as battingTeam, eve.FLD_TEAM_ID as fieldingTeam, eve.BAT_ID as player, eve.PITCH_SEQ_TX as pitchSequence, eve.BALLS_CT as balls, eve.STRIKES_CT as strikes, eve.EVENT_CD, eve.INN_CT as inning, eve.OUTS_CT as outs, lkpe.VALUE_CD, eve.EVENT_TX, lkpe.SHORTNAME_TX, lkpe.LONGNAME_TX, eve.START_BASES_CD, lkpb.SHORTNAME_TX as sN, lkpb.LONGNAME_TX as lN, eve.END_BASES_CD, lkpb2.SHORTNAME_TX as sN2, lkpb2.LONGNAME_TX as lN2, eve.EVENT_OUTS_CT as outsOnPlay, eve.EVENT_RUNS_CT as runsOnPlay, gm.PARK_ID as ballparkID, eve.HOME_TEAM_ID as homeTeam, gm.HOME_HITS_CT as homeHits, gm.HOME_SCORE_CT as homeScore, eve.AWAY_TEAM_ID as awayTeam, gm.AWAY_HITS_CT as awayHits, gm.AWAY_SCORE_CT as awayScore 
	FROM events eve
		-- join the event values
		LEFT JOIN lkup_cd_event lkpe
			ON (eve.EVENT_CD = lkpe.VALUE_CD)
		LEFT JOIN lkup_cd_bases lkpb
			ON (eve.START_BASES_CD = lkpb.VALUE_CD)
		LEFT JOIN lkup_cd_bases lkpb2
			ON (eve.END_BASES_CD = lkpb2.VALUE_CD)
		LEFT JOIN games gm
			ON (eve.GAME_ID = gm.GAME_ID)
		-- LEFT JOIN rosters rost
			-- ON (eve.BAT_ID = rost.PLAYER_ID)
		-- WHERE gm.GAME_DT < 110000
		ORDER BY eve.GAME_ID, eve.BAT_TEAM_ID, eve.INN_CT, eve.OUTS_CT;


-- Ssecondary one, just for diagnosing the rosters problem:
SELECT eve.BAT_ID, rost.FIRST_NAME_TX, rost.LAST_NAME_TX, eve.EVENT_CD, lkpe.VALUE_CD,eve.EVENT_TX, lkpe.SHORTNAME_TX, lkpe.LONGNAME_TX, lkpb.VALUE_CD, lkpb.SHORTNAME_TX,lkpb.LONGNAME_TX,eve.EVENT_OUTS_CT, eve.RBI_CT, eve.BAT_DEST_ID, eve.RUN1_DEST_ID, eve.RUN2_DEST_ID, eve.RUN3_DEST_ID, eve.BAT_PLAY_TX, eve.START_BAT_SCORE_CT, eve.START_FLD_SCORE_CT, eve.GAME_ID, eve.AWAY_TEAM_ID, eve.HOME_TEAM_ID, eve.OUTS_CT, rost.BAT_HAND_CD, gm.GAME_DT, gm.AWAY_SCORE_CT, gm.HOME_SCORE_CT, gm.AWAY_HITS_CT, gm.HOME_HITS_CT
	FROM events eve
		-- join the event values
		LEFT JOIN lkup_cd_event lkpe
			ON (eve.EVENT_CD = lkpe.VALUE_CD)
		-- join the bases  
		LEFT JOIN lkup_cd_bases lkpb
			ON (eve.START_BASES_CD = lkpb.VALUE_CD)
		-- join the games info
		LEFT JOIN games gm
			ON (eve.GAME_ID = gm.GAME_ID)
		-- join the roster information
		LEFT JOIN rosters rost
			ON (eve.BAT_ID = rost.PLAYER_ID)
		-- clear for year --> this case is 2013
		-- WHERE (gm.GAME_DT < 20140000 and gm.GAME_DT > 20130000)
        
        WHERE eve.BAT_ID = 'altuj001'
        
        -- no real need to order, just for small data cleanup:
		-- ORDER BY rost.LAST_NAME_TX DESC
        -- should expand for no limit during data output
		limit 100;
           

-- BASELINE QUERY, used to fill in needed columns for efficient one at top :
SELECT *
	FROM events eve
		LEFT JOIN lkup_cd_event lkpe
			ON (eve.EVENT_CD = lkpe.VALUE_CD)
		LEFT JOIN lkup_cd_bases lkpb
			ON (eve.START_BASES_CD = lkpb.VALUE_CD)
		LEFT JOIN games gm
			ON (eve.GAME_ID = gm.GAME_ID)
		LEFT JOIN rosters rost
			ON (eve.BAT_ID = rost.PLAYER_ID)
		where (gm.GAME_DT < 20140000 and gm.GAME_DT > 20130000)
           limit 100;
           

		
-- here is huge problem with joining the rosters, still trying to debug
DROP TABLE IF EXISTS temp2;
CREATE TABLE temp2 as
SELECT t.player, rost.FIRST_NAME_TX as firstName, rost.LAST_NAME_TX as lastName, rost.POS_TX as positionID
	FROM temp t
		LEFT JOIN rosters rost
			ON (t.player = rost.PLAYER_ID);