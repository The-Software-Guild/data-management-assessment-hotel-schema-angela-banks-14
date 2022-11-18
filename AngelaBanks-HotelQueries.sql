USE HotelDB;

#Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT `name`, room_number, start_date, end_date FROM Reservation
JOIN Room ON Reservation.roomID = Room.roomID
WHERE MONTH(end_date) = 7 and YEAR(end_date) = 2023;

#Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT `name`, room_number, start_date, end_date FROM Reservation
JOIN Room ON Reservation.roomID = Room.roomID
JOIN RoomAmenity ON Room.roomID = RoomAmenity.roomID AND RoomAmenity.amenityID = 2;

#Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
SELECT `name`, room_number, start_date, (adults + children) as total_guests
FROM Reservation
INNER JOIN Room ON Reservation.roomID = Room.roomID
WHERE Reservation.guestID = 1; 

#Write a query that returns all rooms with a capacity of three or more and that are reserved on any date in April 2023.
SELECT * FROM Room
INNER JOIN Reservation ON Room.roomID = Reservation.roomID 
WHERE maximum_occupancy >= 3 AND MONTH(start_date) = 4 AND YEAR(start_date) = 2023;

#Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT 
SUBSTRING_INDEX(Guest.`name`, ' ', -1) as LastName,
COUNT(reservation.reservationID) AS total_reservation
FROM Guest
INNER JOIN Reservation ON Guest.guestID = Reservation.guestID 
GROUP BY Reservation.guestId
ORDER BY total_reservation DESC;

#Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
SELECT `name`, address, phone FROM guest
WHERE phone = '(123) 456-7890';