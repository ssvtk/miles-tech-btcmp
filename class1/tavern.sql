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
  PRIMARY KEY ([user_id])
);

CREATE TABLE [floor] (
  [floor_number] int,
  PRIMARY KEY ([floor_number])
);

CREATE TABLE [rat] (
  [id] int IDENTITY(1,1),
  [name] varchar(50),
  [floor_number] int,
  PRIMARY KEY ([id])
);

CREATE TABLE [supply] (
  [supply_id] int IDENTITY(1,1),
  [unit] varchar(40),
  [name] varchar(50),
  PRIMARY KEY ([supply_id])
);

CREATE TABLE [counts] (
  [id] int IDENTITY(1,1),
  [supply_id] varchar(50),
  [tavern_id] varchar(50),
  [date] date,
  [current_count] int,
  PRIMARY KEY ([id])
);

CREATE TABLE [receivement] (
  [id] int IDENTITY(1,1),
  [supply_id] int,
  [tavern_id] int,
  [cost] int,
  [amount] int,
  [date] date,
  PRIMARY KEY ([id])
);

CREATE TABLE [service] (
  [service_id] int IDENTITY(1,1),
  [name] varchar(50),
  [status_id] int,
  [tavern_id] int,
  PRIMARY KEY ([service_id])
);

CREATE TABLE [service_status] (
  [id] int IDENTITY(1,1),
  [status] varchar(50),
  PRIMARY KEY ([id])
);

CREATE TABLE [sales] (
  [id] int IDENTITY(1,1),
  [service_id] int,
  [tavern_id] int,
  [guest] varchar(50),
  [price] int,
  [date_purchased] date,
  PRIMARY KEY ([id])
);

