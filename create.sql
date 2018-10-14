create user 'bckp'@'localhost' identified by 'CHANGEME!';
grant SELECT,RELOAD,LOCK TABLES on *.* to 'bckp'@'localhost';
flush privileges;
