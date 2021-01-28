CREATE TABLE [tavern] (
  [tavern_id] int IDENTITY(1,1),
  [name] varchar(50),
  [location] varchar(70),
  [owner] varchar(50),
  [floor_count] int,
  PRIMARY KEY ([tavern_id])
);


CREATE TABLE [user] (
  [user_id] int IDENTITY(1,1),
  [tavern_id] int,
  [name] varchar(50),
  [role] varchar(50),
  [role_description] varchar(150),
  PRIMARY KEY ([user_id]),
);
--Example of altering...
ALTER TABLE [user]
ADD FOREIGN KEY (tavern_id) REFERENCES tavern(tavern_id);

CREATE TABLE [floor] (
  [floor_number] int,
  PRIMARY KEY ([floor_number])
);

CREATE TABLE [supply] (
  [supply_id] int IDENTITY(1,1),
  [unit] varchar(40),
  [name] varchar(50),
  PRIMARY KEY ([supply_id])
);

CREATE TABLE [counts] (
  [id] int IDENTITY(1,1),
  [supply_id] int,
  [tavern_id] int,
  [date] date,
  [current_count] int,
  PRIMARY KEY ([id]),
  FOREIGN KEY (supply_id) REFERENCES supply(supply_id),
  FOREIGN KEY (tavern_id) REFERENCES tavern(tavern_id),
);

CREATE TABLE [receivement] (
  [id] int IDENTITY(1,1),
  [supply_id] int,
  [tavern_id] int,
  [cost] int,
  [amount] int,
  [date] date,
  PRIMARY KEY ([id]),
  FOREIGN KEY (supply_id) REFERENCES supply(supply_id),
  FOREIGN KEY (tavern_id) REFERENCES tavern(tavern_id),
);

CREATE TABLE [service] (
  [service_id] int IDENTITY(1,1),
  [name] varchar(50),
  [status_id] int,
  [tavern_id] int,
  PRIMARY KEY ([service_id]),
  FOREIGN KEY (tavern_id) REFERENCES tavern(tavern_id),
);

CREATE TABLE [service_status] (
  [id] int IDENTITY(1,1),
  [status] varchar(50),
  PRIMARY KEY ([id])
);

CREATE TABLE [service_supplies] (
  [id] int,
  [supply_id] int,
  [tavern_id] int,
  [sales_id] int,
  PRIMARY KEY ([id]),
  FOREIGN KEY (supply_id) REFERENCES supply(supply_id),
  FOREIGN KEY (tavern_id) REFERENCES tavern(tavern_id),
);

CREATE TABLE [sales] (
  [id] int IDENTITY(1,1),
  [service_id] int,
  [tavern_id] int,
  [guest] varchar(50),
  [price] int,
  [date_purchased] date,
  [service_supplies_id] int,
  PRIMARY KEY ([id]),
  FOREIGN KEY (service_id) REFERENCES service(service_id),
  FOREIGN KEY (tavern_id) REFERENCES tavern(tavern_id),
  FOREIGN KEY (service_supplies_id) REFERENCES service_supplies(id),

);

CREATE TABLE [class_list] (
  [class] varchar(50),
  PRIMARY KEY ([class])
);

CREATE TABLE [level] (
  [level] int,
  PRIMARY KEY ([level])
);



CREATE TABLE [class] (
  [id] int,
  [level] int,
  [class] varchar(50),
  PRIMARY KEY ([id]),
  FOREIGN KEY (class) REFERENCES class_list(class),
  FOREIGN KEY (level) REFERENCES level(level),
);



CREATE TABLE [guest] (
  [id] int,
  [notes] varchar(150),
  [birthday] date,
  [tavern_id] int,
  [cakeday] date,
  [status] varchar(150),
  [class] int,
  PRIMARY KEY ([id]),
  FOREIGN KEY (tavern_id) REFERENCES tavern(tavern_id),
  FOREIGN KEY (class) REFERENCES class(class_id),
);

CREATE TABLE [room_stays] (
  [id] int,
  [sale_id] int,
  [guest_id] int,
  [room_number] int,
  [date_of_stay] date,
  [rate_per_night] money,
  PRIMARY KEY ([id]),
  FOREIGN KEY (sale_id) REFERENCES sales(id),
  FOREIGN KEY (guest_id) REFERENCES guest(id),
  FOREIGN KEY (room_number) REFERENCES room(room_number),
);

CREATE TABLE [room] (
  [room_number] int,
  [status] varchar(50),
  [tavern_id] int,
  PRIMARY KEY ([room_number]),
  FOREIGN KEY (tavern_id) REFERENCES tavern(tavern_id),
);
