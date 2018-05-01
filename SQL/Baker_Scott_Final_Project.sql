USE retrosheet1013;
-- AWAY_TEAM_ID as awayTeam,

select count(*) from events;

select count(*) from events e
	RIGHT JOIN games gm
			ON (e.GAME_ID = gm.GAME_ID)
	where (gm.GAME_DT < 20140000 and gm.GAME_DT > 20130000);
-- e.GAME_ID as game, e.PITCH_SEQ_TX as pitchEvent, e.BAT_ID as batter, e.EVENT_CD as play, l.VALUE_ID as value, l.SHORTNAME_TX as sName, l.LONGNAME_TX as description 

SELECT * FROM lkup_id_base limit 10;

-- EFFICIENT 
SELECT eve.BAT_ID, rost.FIRST_NAME_TX, rost.LAST_NAME_TX, eve.EVENT_CD, lkpe.VALUE_CD,eve.EVENT_TX, lkpe.SHORTNAME_TX, lkpe.LONGNAME_TX, lkpb.VALUE_CD, lkpb.SHORTNAME_TX,lkpb.LONGNAME_TX,eve.EVENT_OUTS_CT, eve.RBI_CT, eve.BAT_DEST_ID, eve.RUN1_DEST_ID, eve.RUN2_DEST_ID, eve.RUN3_DEST_ID, eve.BAT_PLAY_TX, eve.START_BAT_SCORE_CT, eve.START_FLD_SCORE_CT, eve.GAME_ID, eve.AWAY_TEAM_ID, eve.HOME_TEAM_ID, eve.OUTS_CT, rost.BAT_HAND_CD, gm.GAME_DT, gm.AWAY_SCORE_CT, gm.HOME_SCORE_CT, gm.AWAY_HITS_CT, gm.HOME_HITS_CT
	FROM events eve
		-- join the event values
		LEFT JOIN lkup_cd_event lkpe
			ON (eve.EVENT_CD = lkpe.VALUE_CD)
		-- join the bases  
		LEFT JOIN lkup_cd_bases lkpb
			ON (eve.START_BASES_CD = lkpb.VALUE_CD)
		-- join the games info
		RIGHT JOIN games gm
			ON (eve.GAME_ID = gm.GAME_ID)
		-- join the roster information
		LEFT JOIN rosters rost
			ON (eve.BAT_ID = rost.PLAYER_ID)
		-- clear for year --> this case is 2013
		WHERE (gm.GAME_DT < 20140000 and gm.GAME_DT > 20130000)
        -- no real need to order, just for small data cleanup:
		-- ORDER BY rost.LAST_NAME_TX DESC
        -- should expand for no limit during data output
		limit 200000;
           
			
-- BASELINE QUERY, used to fill in needed columns for efficient one ^^^^ :
SELECT *
	FROM events eve
		LEFT JOIN lkup_cd_event lkpe
			ON (eve.EVENT_CD = lkpe.VALUE_CD)
		LEFT JOIN lkup_cd_bases lkpb
			ON (eve.START_BASES_CD = lkpb.VALUE_CD)
		RIGHT JOIN games gm
			ON (eve.GAME_ID = gm.GAME_ID)
		LEFT JOIN rosters rost
			ON (eve.BAT_ID = rost.PLAYER_ID)
		where (gm.GAME_DT < 20140000 and gm.GAME_DT > 20130000)
           limit 30000;
