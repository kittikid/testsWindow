use master
go

use Tests
go

CREATE TABLE [name_test] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name_test] nvarchar(100)
)
GO

CREATE TABLE [question_table] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [question] nvarchar(100),
  [id_name_test] int
)
GO

CREATE TABLE [answer_table] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_question] int,
  [name_answers] nvarchar(100),
  [correct_answer] bit
)
GO

CREATE TABLE [user_score] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_user] int,
  [id_test] int,
  [status] nvarchar(100),
  [progress] int,
  [date] date,
  [time_start] time
)
GO

CREATE TABLE [user_tests] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [id_user_score] int,
  [id_question] int,
  [id_answer] int
)
GO

CREATE TABLE [Users] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [login] nvarchar(100),
  [password] nvarchar(100)
)
GO

ALTER TABLE [question_table] ADD FOREIGN KEY ([id_name_test]) REFERENCES [name_test] ([id])
GO

ALTER TABLE [answer_table] ADD FOREIGN KEY ([id_question]) REFERENCES [question_table] ([id])
GO

ALTER TABLE [user_score] ADD FOREIGN KEY ([id_user]) REFERENCES [Users] ([id])
GO

ALTER TABLE [user_score] ADD FOREIGN KEY ([id_test]) REFERENCES [question_table] ([id])
GO

ALTER TABLE [user_tests] ADD FOREIGN KEY ([id_user_score]) REFERENCES [user_score] ([id])
GO

ALTER TABLE [user_tests] ADD FOREIGN KEY ([id_question]) REFERENCES [question_table] ([id])
GO

ALTER TABLE [user_tests] ADD FOREIGN KEY ([id_answer]) REFERENCES [answer_table] ([id])
GO

INSERT [name_test] (name_test)
	VALUES ('Окружающая среда')
GO