create table sales_staff (
	staff_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);
create table mechanics (
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);
create table customers (
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	phone VARCHAR(25)
);
create table services (
	service_id SERIAL primary key,
	service_name VARCHAR(150),
	amount NUMERIC(6,2)
);
create table parts (
	part_id SERIAL primary key,
	part_name VARCHAR(150),
	amount NUMERIC(6,2)
);
create table cars (
	car_id SERIAL primary key,
	make VARCHAR(50),
	model VARCHAR(50),
	year_ VARCHAR(10),
	condition_ VARCHAR(150),
	cost_ NUMERIC(8,2)
);
create table service_history (
	service_history_id SERIAL primary key,
	service_id INTEGER,
	service_date DATE default CURRENT_DATE,
	car_id INTEGER,
	foreign key(service_id) references services(service_id),
	foreign key(car_id) references cars(car_id)
);
create table invoices (
	invoice_id SERIAL primary key,
	total_cost NUMERIC(8,2),
	customer_id INTEGER,
	staff_id INTEGER,
	car_id INTEGER,
	service_history_id INTEGER,
	date_ DATE default CURRENT_DATE,
	foreign key(customer_id) references customers(customer_id),
	foreign key(staff_id) references sales_staff(staff_id),
	foreign key(car_id) references cars(car_id),
	foreign key(service_history_id) references service_history(service_history_id)
);
create table service_tickets (
	ticket_id SERIAL primary key,
	service_id INTEGER,
	service_history_id INTEGER,
	customer_id INTEGER,
	mechanic_id INTEGER,
	part_id INTEGER,
	car_id INTEGER,
	total_cost NUMERIC(6,2),
	date_ DATE default CURRENT_DATE,
	foreign key(service_id) references services(service_id),
	foreign key(service_history_id) references service_history(service_history_id),
	foreign key(customer_id) references customers(customer_id),
	foreign key(mechanic_id) references mechanics(mechanic_id),
	foreign key(part_id) references parts(part_id),
	foreign key(car_id) references cars(car_id)
);












