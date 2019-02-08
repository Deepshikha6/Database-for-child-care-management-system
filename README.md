#Orphanage Management System
Problem Statement
Implementing database for an orphanage which takes care of the orphans and at the same time allows people to adopt kid from the orphanage.
Entities used for constructing the database are mentioned below:
Person: This stores the basic details for a person such as name, contact details, birthdate, gender, role of the person in the orphanage and email id. This acts a super class for four different entities in database. Hence, this behave as a super type and the one inheriting from this are the sub types.
Orphanage: It keep records of the orphanage name and its location. This entity stores the different orphanage situated at different locations.
Child: This entity keeps the records for the child present under the orphanage. Also gives the detail such as child is adopted or still in orphanage.
Caretaker: This entity is to keep the details of the employee present and working for the orphanage. They also take care of the child present. This table gives the details which child is assigned under which caretaker.
Sponsor: This entity gives the details of the people are sponsor for one or many resources required by the orphanage to take care of kids.
Volunteer_for_adoption: This entity keeps track of the people who adopted a id from the orphanage. There details and the adoption details such as when was request for adoption generate and processed.
Resources: This entity keep tracks of the item required by the orphanage for managing the necessity of the kids. It gives the present resource status and when was it given.
Medical: This gives the history records for the kids who were sick in past. It gives the details of the kids wo was referred to hospital and what is his/her current status.
Education: This entity gives the status of the education of the kids present at orphanage such as which school they are going to, their start and end date for education in this orphanage.

Business Requirements:
•	Each child should be assigned under a caretaker
•	Sponsor can donate n number of times for any of the resources.
•	Person can be a sponsor and foster parent at the same time.
•	Once a kid is adopted he/she is removed from the school under the orphanage
•	Not necessary that each kid will be adopted few can remain unadopted
