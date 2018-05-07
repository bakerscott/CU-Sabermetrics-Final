# CU-Sabermetrics-Final
Final project for CSCI 4831: Sabermetrics at University of Colorado, Boulder

## FINAL UPDATES FOR SUBMISSION (MAY 7, 2018 11am) :

* Video can be found at: `https://youtu.be/6HhfQiUxFPw`


* `/SQL/` includes:
	* `Baker_Scott_Final_Project.sql`: main sql file run on standard Retrosheet database
		* `rawData2010_2013.csv`: saved from this sql file
			* `README.md`: has column readme for this data file
	* `Baker_Scott_Final_Project_rosterExport.sql`: sql script to get player information
		* `rosterData2010_2013.csv`: saved from this sql file
	* `mSHS_database.sql`: sql script to build a database with the mSHS scores
		* `mSHSdatabase.csv`: data file used to build this script



* `/Python/` includes:
	* `Baker_Scott_Final_Project.ipynb`: Jupyter Notebook with analysis and output to:
		* `mSHS.csv`: data file with all players mSHS values
	* Images used in the writeup, from the Jupyter Notebook



* `/Writeup` includes:
	* `mSHS-Baker-Scott.pdf`: MAIN WRITEUP about the mSHS statistic



* `/Images/` includes all images to make the website pretty



* Main Folder includes:
	* `index.html`: main HTML/CSS CODE for the website at bakerscott.github.io/CU-Sabermetrics-Final
	* `FantasticFour_Lab_15.html`: webpage for APPM2720 final project, on baseball







## UPDATES MAY 2, 2018:

* /SQL/ folder includes v2 .sql script good enough to output correct .csv file
	* still debug the join between events and rosters; workaround prefered

* /Python/ folder includes v2 .ipynb script with skeleton outline for calulation
	* need to add marginal weights for runs and outs
	* need to add "advancing" runners weights
	* need to consider case of "sac hits"


## UPDATES APRIL 30, 2018:

* /SQL/ folder includes v1 .sql script
	* Runtime improvements will be made when necessary "columns" are identified
	* Script uses 2010-2013 data and will be reused for 2017 data

* /Python/ folder includes v1 .ipynb file

* Link to website is live: bakerscott.github.io/CU-Sabermetrics-Final
	* Will beautify after main python code is written
	* Index.html page is only current page live
