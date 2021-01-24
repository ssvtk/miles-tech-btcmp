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
