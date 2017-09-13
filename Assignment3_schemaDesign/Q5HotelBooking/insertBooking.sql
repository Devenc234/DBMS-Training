INSERT INTO `HotelBookingModel`.`Booking` (`customerID`, `BookingDate`, `hotelID`, `BookingType`, `BookingPrice`) VALUES ('1', '2012-12-31', '1', 'Loyal', '1150.50');
INSERT INTO `HotelBookingModel`.`Booking` (`customerID`, `BookingDate`, `hotelID`, `BookingType`, `BookingPrice`) VALUES ('1', '2012-12-25', '1', 'Loyal', '2500');
INSERT INTO `HotelBookingModel`.`Booking` (`customerID`, `BookingDate`, `hotelID`, `BookingType`, `BookingPrice`) VALUES ('2', '2012-12-25', '1', 'NewUser', '1500');
INSERT INTO `HotelBookingModel`.`Booking` (`customerID`, `BookingDate`, `hotelID`, `BookingType`, `BookingPrice`) VALUES ('3', '2017-8-12', '2', 'Loyal', '5000');

-- Trying to insert same user on same date
-- INSERT INTO `HotelBookingModel`.`Booking` (`customerID`, `BookingDate`, `hotelID`, `BookingType`, `BookingPrice`) VALUES ('2', '2012-12-25', '1', 'Loyal', '1200');
-- 