-- --Trigger for Email check----------------
DELIMITER $
CREATE  TRIGGER emailcheck_before_insert BEFORE INSERT ON person FOR EACH ROW BEGIN
IF (NEW.Email_id REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$' and NEW.Email_id <> null)=0   THEN
        SIGNAL SQLSTATE VALUE '45000'
            SET MESSAGE_TEXT = '[table:person] - `email` incorrect format!';
END IF;
END $
DELIMITER ;

drop trigger emailcheck_before_insert;
-- ---------------------------------------------
-- Trigger for making sure that email for Child is set to N/A-------------
DELIMITER $
CREATE  TRIGGER status_update AFTER INSERT ON volunteer_for_adoption FOR EACH ROW 
BEGIN
Update child set Current_Status='Adopted' where child.Person_idPerson= New.child_Person_idPerson;
Update education set Education_end_date=CURDATE() where education.child_Person_idPerson= New.child_Person_idPerson;
END$
DELIMITER ;

select * from child;
select * from education;
SELECT * FROM volunteer_for_adoption;




