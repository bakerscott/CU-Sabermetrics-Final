USE retrosheet1013;

select count(*) from rosters;

DROP TABLE IF EXISTS batExport;
CREATE TABLE batExport AS
	SELECT r.PLAYER_ID, r.FIRST_NAME_TX, r.LAST_NAME_TX, aH.hits, aB.AB, hit.average -- , r.TEAM_ID, r.POS_TX
		FROM rosters r
        LEFT JOIN allhits aH
        ON(r.PLAYER_ID = aH.BAT_ID)
        LEFT JOIN atbats aB
        ON(r.PLAYER_ID = aB.BAT_ID)
        LEFT JOIN hitting hit
        ON(r.PLAYER_ID = hit.BAT_ID);
        
select DISTINCT *  from batExport;