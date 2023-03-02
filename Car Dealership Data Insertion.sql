insert into cars(
	car_id,
	make,
	model,
	year_,
	condition_,
	cost_
) values (
	1,
	'ford',
	'escape',
	'2005',
	'used',
	12000.00
);
insert into cars(
	car_id,
	make,
	model,
	year_,
	condition_,
	cost_
) values (
	2,
	'subaru',
	'outback',
	'2014',
	'used',
	14000.00
);
insert into cars(
	car_id,
	make,
	model,
	year_,
	condition_,
	cost_
) values (
	3,
	'dodge',
	'ram',
	'2023',
	'new',
	45000.00
);
create or replace function add_staff(_staff_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $MAIN$
begin 
	insert into sales_staff(staff_id, first_name, last_name)
	values (_staff_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_staff(1, 'Mark', 'Evans');
select add_staff(2, 'Jakob', 'Nelson');
select add_staff(3, 'Rachel', 'Lindonberg');

create or replace function add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $MAIN$
begin 
	insert into mechanics(mechanic_id, first_name, last_name)
	values (_mechanic_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_mechanic(1, 'Randy', 'Sullivan');
select add_mechanic(2, 'Joe', 'Sylvester');
select add_mechanic(3, 'Kyle', 'Richards');

create or replace function add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _address VARCHAR, _phone VARCHAR)
returns void
as $MAIN$
begin 
	insert into customers(customer_id, first_name, last_name, address, phone)
	values (_customer_id, _first_name, _last_name, _address, _phone);
end;
$MAIN$
language plpgsql;

select add_customer(1, 'Jeff', 'Jeffers', '1234 W 2nd Ave', '303-234-7868');
select add_customer(2, 'Sal', 'Amander', '455 Elephant St', '720-665-3245');
select add_customer(3, 'Mea', 'Johnson', '4300 Circle Ct', '303-876-2344');
select add_customer(4, 'Bethany', 'Motorola', '1 Two Lane', '303-123-7690');
select add_customer(5, 'Suzy', 'Shitake', '1984 Turtle Ave', '303-648-5637');

create or replace function add_parts(_part_id INTEGER, _part_name VARCHAR, _amount numeric(6,2))
returns void
as $MAIN$
begin 
	insert into parts(part_id, part_name, amount)
	values (_part_id, _part_name, _amount);
end;
$MAIN$
language plpgsql;

select add_parts(1, 'spark plugs', 24.95);
select add_parts(2, 'serpentine belt', 89.99);
select add_parts(3, 'catalytic converter', 1000.00);
select add_parts(4, 'brake pads', 450.00);

create or replace function add_service(_service_id INTEGER, _service_name VARCHAR, _amount numeric(6,2))
returns void
as $MAIN$
begin 
	insert into services(service_id, service_name, amount)
	values (_service_id, _service_name, _amount);
end;
$MAIN$
language plpgsql;

select add_service(1, 'Oil Change', 34.99);
select add_service(2, 'Tire Rotation', 59.99);
select add_service(3, 'Alignment Check', 25.50);
select add_service(4, 'Brake Check', 70.49);

insert into service_history (
	service_history_id,
	service_id,
	service_date,
	car_id
) values (
	1,
	1,
	CURRENT_DATE,
	2
);

insert into service_history (
	service_history_id,
	service_id,
	service_date,
	car_id
) values (
	2,
	1,
	CURRENT_DATE,
	2
);
insert into service_history (
	service_history_id,
	service_id,
	service_date,
	car_id
) values (
	3,
	2,
	CURRENT_DATE,
	1
);
insert into service_history (
	service_history_id,
	service_id,
	service_date,
	car_id
) values (
	4,
	3,
	CURRENT_DATE,
	3
);

insert into invoices (
	invoice_id,
	total_cost,
	customer_id,
	staff_id,
	car_id,
	service_history_id,
	date_ 
) values (
	1,
	15000.00,
	1,
	2,
	3,
	1,
	CURRENT_DATE
);

insert into invoices (
	invoice_id,
	total_cost,
	customer_id,
	staff_id,
	car_id,
	service_history_id,
	date_ 
) values (
	2,
	19000.00,
	4,
	3,
	1,
	2,
	CURRENT_DATE
);
insert into invoices (
	invoice_id,
	total_cost,
	customer_id,
	staff_id,
	car_id,
	service_history_id,
	date_ 
) values (
	3,
	27000.00,
	1,
	1,
	2,
	3,
	CURRENT_DATE
);

insert into service_tickets (
	ticket_id,
	service_id,
	service_history_id,
	customer_id,
	mechanic_id,
	part_id,
	car_id,
	total_cost,
	date_
) values (
	1,
	1,
	3,
	3,
	2,
	null,
	1,
	49.99,
	CURRENT_DATE
);

insert into service_tickets (
	ticket_id,
	service_id,
	service_history_id,
	customer_id,
	mechanic_id,
	part_id,
	car_id,
	total_cost,
	date_
) values (
	2,
	1,
	1,
	3,
	1,
	null,
	3,
	69.99,
	CURRENT_DATE
);

insert into service_tickets (
	ticket_id,
	service_id,
	service_history_id,
	customer_id,
	mechanic_id,
	part_id,
	car_id,
	total_cost,
	date_
) values (
	3,
	1,
	2,
	2,
	1,
	2,
	null,
	109.99,
	CURRENT_DATE
);










