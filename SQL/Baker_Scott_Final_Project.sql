USE retrosheet1013;
-- AWAY_TEAM_ID as awayTeam,

select count(*) from events;

select * from games where (GAME_DT < 20140000 and GAME_DT > 20130000);
-- e.GAME_ID as game, e.PITCH_SEQ_TX as pitchEvent, e.BAT_ID as batter, e.EVENT_CD as play, l.VALUE_ID as value, l.SHORTNAME_TX as sName, l.LONGNAME_TX as description 

SELECT * FROM lkup_id_base limit 10;

-- EFFICIENT 
SELECT eve.GAME_ID, eve.AWAY_TEAM_ID, eve.HOME_TEAM_ID, eve.EVENT_CD, eve.OUTS_CT, lkp.VALUE_CD, lkp.SHORTNAME_TX,
	gm.AWAY_TEAM_ID, gm.HOME_TEAM_ID
    
    
    
    
	FROM events eve
		-- join the event values
		LEFT JOIN lkup_cd_event lkpe
			ON (eve.EVENT_CD = lkpe.VALUE_CD)
		-- join the bases  
		LEFT JOIN lkup_cd_bases lkpb
			ON (eve.START_BASES_CD = lkpb.VALUE_CD)
		RIGHT JOIN games gm
			ON (eve.GAME_ID = gm.GAME_ID)
		LEFT JOIN rosters rost
			ON (eve.BAT_ID = rost.PLAYER_ID)
		where (gm.GAME_DT < 20140000 and gm.GAME_DT > 20130000)
           ;
           
			
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
           limit 20000;



select VALUE_CD, SHORTNAME_TX as sName, LONGNAME_TX as description from lkup_cd_event;