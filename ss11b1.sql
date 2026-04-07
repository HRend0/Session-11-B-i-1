create schema ss11b1;
create table ss11b1.flights (
flight_id varchar(10) primary key,
flight_name varchar(100),
available_seats int
);
create table ss11b1.bookings (
booking_id serial primary key,
flight_id varchar(10) references ss11b1.flights(flight_id),
customer_name varchar(100)
);

insert into ss11b1.flights (flight_id, flight_name, available_seats)
values ('VN123', 'Chuyến bay Hà Nội - Đà Nẵng', 3),
       ('VN456', 'Chuyến bay TP.HCM - Hà Nội', 2);

begin;
update ss11b1.flights 
set available_seats = available_seats - 1 
where flight_id = 'VN123';

insert into ss11b1.bookings (flight_id, customer_name) 
values ('VN123', 'Nguyen Van A');

commit;

select * from ss11b1.flights;
select * from ss11b1.bookings;

begin;

update ss11b1.flights 
set available_seats = available_seats - 1 
where flight_id = 'VN123';

insert into ss11b1.bookings (flight_id, customer_name) 
values ('VN999', 'Nguyen Van B'); 

rollback;

select * from ss11b1.flights;
select * from ss11b1.bookings;