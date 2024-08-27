-- Event Management System

CREATE DATABASE EventsManagement;

use EventsManagement;

CREATE TABLE Events (
    Event_Id INT PRIMARY KEY AUTO_INCREMENT,
    Event_Name VARCHAR(255),
    Event_Date DATE,
    Event_Location VARCHAR(255),
    Event_Description TEXT
);
CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY AUTO_INCREMENT,
    Attendee_Name VARCHAR(255),
    Attendee_Phone VARCHAR(20),
    Attendee_Email VARCHAR(255),
    Attendee_City VARCHAR(100)
);


CREATE TABLE Registrations (
    Registration_Id SERIAL PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount NUMERIC(10, 2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
  ('Charity Gala', '2023-10-01', 'Grand Hotel', 'Fundraising event for local charities'),
  ('Coding Workshop', '2023-08-20', 'Tech Center', 'Learn to code for beginners'),
  ('Gardening Seminar', '2023-05-12', 'Botanical Gardens', 'Tips and tricks for home gardening'),
  ('Film Festival', '2023-09-05', 'Cinema Complex', 'Showcase of independent films'),
  ('Wine Tasting', '2023-11-18', 'Vineyard Estate', 'Explore different wines and pairings');


INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
  ('Sarah Lee', '777-888-9999', 'sarah.lee@example.com', 'San Francisco'),
  ('Tom Wilson', '222-333-4444', 'tom.wilson@example.com', 'Boston'),
  ('Olivia Patel', '888-999-0000', 'olivia.patel@example.com', 'Houston'),
  ('Jacob Nguyen', '333-444-5555', 'jacob.nguyen@example.com', 'Atlanta'),
  ('Ava Gonzalez', '666-777-8888', 'ava.gonzalez@example.com', 'Dallas');


INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
  (6, 6, '2023-09-15', 150.00),
  (7, 7, '2023-08-01', 75.00),
  (8, 8, '2023-04-30', 40.00),
  (9, 9, '2023-08-28', 65.00),
  (10, 10, '2023-11-05', 90.00);

  
 
  
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('Business Summit', '2024-12-05', 'Chicago', 'A summit for business professionals.');

UPDATE Events
SET Event_Location = 'Gobi', Event_Date = '2024-01-21'
WHERE Event_Id = 3;

-- To delete the event from the event tables, the specific event to be deleted has to be first removed from registrations table as it refer its event id with event table event_id.
delete from registrations
where event_id = 2;
DELETE FROM Events
WHERE Event_Location = 'Lakeside Park';

INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
('Ben', '222-333-4444', 'ben@example.com', 'Seattle');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 4, '2024-06-15', 150.00);

SELECT * FROM Events;
SELECT Attendees.Attendee_Name, Attendees.Attendee_Email
FROM Attendees
JOIN Registrations ON Attendees.Attendee_Id = Registrations.Attendee_Id
WHERE Registrations.Event_Id = 1;

SELECT e.Event_Name, SUM(r.Registration_Amount) AS Total_Registration_Amount
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;

