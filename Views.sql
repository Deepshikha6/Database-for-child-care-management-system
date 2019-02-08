-- Count of sponsors for an orphanage----------

CREATE view sponsor_count as
Select orphanage.Orphanage_Name, COUNT(sponsor.person_idPerson) as SponsorCount
from orphanage 
join orphanage_has_sponsor on orphanage_has_sponsor.orphanage_idorphanage = orphanage.idorphanage
join sponsor on sponsor.person_idPerson=orphanage_has_sponsor.sponsor_person_idPerson;

-- --------------------------------------------------
-- ----------------------------------------------------
--  Details of child adopted from orphanage
Create view adoption_Detail as
select person.First_Name as 'Child Name',child.Date_Of_Entry ,adoption_details.Adoption_Date, 
adoption_details.volunteer_for_adoption_Person_idPerson as 'Adopted By' from child
join person on person.idPerson=child.Person_idPerson 
-- join person on person.idPerson=volunteer_for_adoption.Person_idPerson 
join volunteer_for_adoption on volunteer_for_adoption.child_Person_idPerson=child.Person_idPerson 
join adoption_details on adoption_details.volunteer_for_adoption_Person_idPerson= volunteer_for_adoption.Person_idPerson;