
create procedure sp_updatecourseduration
@CourseID int ,
@NewDuration varchar(255)
As begin
Update Courses 
set Duration=@NewDuration
where ID=@CourseID;
end;
GO

CREATE PROCEDURE sp_AddAdmin
    @Name VARCHAR(255),
    @Email VARCHAR(255),
    @Title VARCHAR(255),
    @Password VARCHAR(255)
AS
BEGIN
    INSERT INTO Users (Name, Email, Title, password, Role)
    VALUES (@Name, @Email, @Title, @Password, 0); -- Role 0 يمثل Admin
    
    PRINT 'Admin added successfully.';
END;
GO

