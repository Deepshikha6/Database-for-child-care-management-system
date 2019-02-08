-- Adding data into Person and Child----------
START TRANSACTION;
CALL Insert_into_Person ('Joy','Brown','2018-07-01','Male','Child','');
CALL Insert_into_child (CURDATE(), last_insert_id() , 3, 1);
commit;

-- Adding data into Person and Sponsor--------
START TRANSACTION;
CALL Insert_into_Person ('Upay','Dana','2000-07-01','Female','Sponsor','upay@gmail.com');
CALL Insert_into_sponsor ('Food',CURDATE(),200,last_insert_id());
commit;

-- Adding data into Person and caretaker-------
START TRANSACTION;
CALL Insert_into_Person ('Wu','Wang','1990-11-01','Female','Caretaker','wu@gmail.com');
CALL Insert_into_caretaker (CURDATE(),last_insert_id(),1);
commit;

-- Adding data into Person and volunteer-------
START TRANSACTION;
CALL Insert_into_Person ('Jimmy','Sen','1992-04-21','Male','Foster','jim@gmail.com');
CALL Insert_into_volunteer_for_adoption (CURDATE(),last_insert_id(),9);
commit;

-- 