linux command to start postgres when you have permission error:
	sudo -u postgres [COMMAND]..


**Starting service**
sudo -u postgres service postgresql start


**startup cli**
sudo -u postgres psql "dbname"
	--> \c "dbname"

Default postgresql port = 5432

dependencies: org.slf4j/slf4j-log4j12 v1.4.2
											postgresql v42.2.2.jre7
											hibernate-entitymanager v3.4.0.GA
