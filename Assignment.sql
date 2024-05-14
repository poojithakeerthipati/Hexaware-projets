CREATE TABLE [Venue] (
	[Venue_id] VARCHAR(50),
	[Venue_name] VARCHAR(50),
	[address] VARCHAR(50),
	PRIMARY KEY ([Venue_id]));


CREATE TABLE [EVENT] (
	[EVENT_ID] VARCHAR(50),
	[EVENT_NAME] VARCHAR(50),
	[EVENT_DATE] DATE,
	[EVENT_TIME] TIME,
	[VENUE_ID] VARCHAR(50),
	[TOTAL_SEATS] INT,
	[AVAILABLE_SEATS] INT,
	[TICKET_PRICE] DECIMAL,
	[EVENT_TYPE] VARCHAR(50),
	[BOOKING_ID] VARCHAR(50)
	PRIMARY KEY ([EVENT_ID]),
	Foreign Key ([VENUE_ID]) references VENUE([VENUE_ID]),
	--Foreign Key ([BOOKING_ID]) references BOOKING([BOOKING_ID]),
);

CREATE TABLE [CUSTOMER] (
	[CUSTOMER_ID] VARCHAR(50),
	[CUSTOMER_NAME] VARCHAR(50),
	[EMAIL] VARCHAR(50),
	[PHONE_NUMBER] VARCHAR(50),
	[BOOKING_ID] VARCHAR(50),
	PRIMARY KEY ([CUSTOMER_ID]),
	--Foreign Key ([BOOKING_ID]) references BOOKING([BOOKING_ID]),
);


CREATE TABLE [BOOKING] (
	[BOOKING_ID] VARCHAR(50),
	[CUSTOMER_ID] VARCHAR(50),
	[EVENT_ID] VARCHAR(50),
	[NUM_TICKETS] INT,
	[TOTAL_COST] DECIMAL,
	[BOOKING_DATE] DATE
	PRIMARY KEY ([BOOKING_ID]),
	Foreign Key ([CUSTOMER_ID]) references CUSTOMER([CUSTOMER_ID]),
	Foreign Key ([EVENT_ID]) references EVENT([EVENT_ID]),
);

ALTER TABLE EVENT
   ADD FOREIGN KEY (BOOKING_ID)
      REFERENCES BOOKING (BOOKING_ID);

ALTER TABLE CUSTOMER
   ADD FOREIGN KEY (BOOKING_ID)
      REFERENCES BOOKING (BOOKING_ID);


-- Inserting sample records into Venue table
INSERT INTO Venue (Venue_id, Venue_name, address)
VALUES 
    ('V001', 'City Cinema', '123 Main St'),
    ('V002', 'Stadium Arena', '456 Stadium Ave'),
    ('V003', 'Music Hall', '789 Center Blvd'),
    ('V004', 'Town Hall', '101 Oak St'),
    ('V005', 'Sports Center', '555 Arena Rd'),
    ('V006', 'Lakefront Pavilion', '888 Lakeview Dr'),
    ('V007', 'Theater District', '333 Broadway'),
    ('V008', 'Garden Amphitheater', '444 Park Ave'),
    ('V009', 'Community Center', '777 Elm St'),
    ('V010', 'Event Hall', '222 Center Ave');

-- Inserting sample records into EVENT table
INSERT INTO EVENT (EVENT_ID, EVENT_NAME, EVENT_DATE, EVENT_TIME, VENUE_ID, TOTAL_SEATS, AVAILABLE_SEATS, TICKET_PRICE, EVENT_TYPE)
VALUES
    ('E001', 'Avengers: Endgame', '2024-05-15', '19:00:00', 'V001', 200, 200, 12.50, 'Movie'),
    ('E002', 'NBA Finals Game 1', '2024-06-10', '20:00:00', 'V002', 18000, 18000, 75.00, 'Sports'),
    ('E003', 'Taylor Swift Live', '2024-07-05', '21:00:00', 'V003', 5000, 5000, 100.00, 'Concert'),
    ('E004', 'Local Comedy Night', '2024-06-25', '19:30:00', 'V007', 150, 150, 20.00, 'Other'),
    ('E005', 'Family Movie Day', '2024-05-20', '14:00:00', 'V010', 100, 100, 8.00, 'Movie'),
    ('E006', 'High School Graduation', '2024-06-15', '15:00:00', 'V004', 500, 500, 0.00, 'Other'),
    ('E007', 'Summer Music Festival', '2024-07-20', '16:00:00', 'V006', 3000, 3000, 50.00, 'Concert'),
    ('E008', 'Charity Gala', '2024-08-05', '18:30:00', 'V008', 400, 400, 150.00, 'Other'),
    ('E009', 'Soccer Match', '2024-06-01', '19:45:00', 'V005', 15000, 15000, 30.00, 'Sports'),
    ('E010', 'Classic Movie Night', '2024-05-30', '19:00:00', 'V001', 150, 150, 10.00, 'Movie');

-- Inserting sample records into CUSTOMER table
INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, EMAIL, PHONE_NUMBER)
VALUES
    ('C001', 'Alice Johnson', 'alice@example.com', '123-456-7890'),
    ('C002', 'Bob Smith', 'bob@example.com', '987-654-3210'),
    ('C003', 'Carol Davis', 'carol@example.com', '555-123-4567'),
    ('C004', 'David Lee', 'david@example.com', '333-555-7777'),
    ('C005', 'Emily White', 'emily@example.com', '999-888-7777'),
    ('C006', 'Frank Brown', 'frank@example.com', '444-222-1111'),
    ('C007', 'Grace Taylor', 'grace@example.com', '777-999-1111'),
    ('C008', 'Henry Clark', 'henry@example.com', '111-333-5555'),
    ('C009', 'Ivy Anderson', 'ivy@example.com', '222-444-6666'),
    ('C010', 'Jack Roberts', 'jack@example.com', '666-888-2222');

-- Inserting sample records into BOOKING table with manually generated BOOKING_ID values
INSERT INTO BOOKING (BOOKING_ID, CUSTOMER_ID, EVENT_ID, NUM_TICKETS, TOTAL_COST, BOOKING_DATE)
VALUES
    ('B001', 'C001', 'E001', 2, 25.00, '2024-05-10'),
    ('B002', 'C002', 'E002', 4, 300.00, '2024-06-01'),
    ('B003', 'C003', 'E003', 3, 300.00, '2024-07-01'),
    ('B004', 'C004', 'E004', 1, 20.00, '2024-06-20'),
    ('B005', 'C005', 'E005', 5, 40.00, '2024-05-15'),
    ('B006', 'C006', 'E006', 10, 0.00, '2024-06-05'),
    ('B007', 'C007', 'E007', 2, 100.00, '2024-07-10'),
    ('B008', 'C008', 'E008', 2, 300.00, '2024-08-01'),
    ('B009', 'C009', 'E009', 3, 90.00, '2024-05-25'),
    ('B010', 'C010', 'E010', 2, 20.00, '2024-05-20');

USE TICKET_BOOKING_SYSTEM;
--Write a SQL query to list all Events.

SELECT * FROM EVENT;
seLECT * FROM BOOKING;
SELECT * FROM CUSTOMER;
SELECT * FROM VENUE;

-- 3. Write a SQL query to select events with available tickets. 
SELECT * from event WHERE AVAILABLE_SEATS >0;

--Write a SQL query to select events name partial match with ‘cup’. 
SELECT * FROM EVENT WHERE EVENT_NAME LIKE '%cup%';

--5. Write a SQL query to select events with ticket price range is between 1000 to 2500. 
SELECT * FROM EVENT WHERE TICKET_PRICE BETWEEN 1000 AND 2500;

--6. Write a SQL query to retrieve events with dates falling within a specific range. 
SELECT * FROM EVENT WHERE EVENT_DATE BETWEEN '2024-06-01' AND '2024-08-15';

--7. Write a SQL query to retrieve events with available tickets that also have "Concert" in their name. 

SELECT * FROM EVENT WHERE AVAILABLE_SEATS >0 AND EVENT_TYPE LIKE 'CONCERT';
--8. Write a SQL query to retrieve users in batches of 5, starting from the 6th user. 
SELECT * 
FROM CUSTOMER 
ORDER BY CUSTOMER_ID
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;




--9. Write a SQL query to retrieve bookings details contains booked no of ticket more than 4. 
SELECT * FROM BOOKING WHERE NUM_TICKETS >4;

--10. Write a SQL query to retrieve customer information whose phone number end with ‘000’ 
SELECT * FROM CUSTOMER WHERE PHONE_NUMBER LIKE '%000'
--11. Write a SQL query to retrieve the events in order whose seat capacity more than 15000.
SELECT * FROM EVENT WHERE TOTAL_SEATS>15000 ORDER BY EVENT_DATE;
--12. Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’
SELECT * FROM EVENT
WHERE event_name NOT LIKE 'x%' AND
      event_name NOT LIKE 'y%' AND
      event_name NOT LIKE 'z%';

	  SELECT *
    (SELECT COUNT(NUM_TICKETS) 
     FROM BOOKING 
     WHERE CUSTOMER.BOOKING_ID = BOOKING.BOOKING_ID AND booking_date >= CURRENT_DATE - INTERVAL '30 day')
FROM 
    CUSTOMER;
USE TICKET_BOOKING_SYSTEM;

