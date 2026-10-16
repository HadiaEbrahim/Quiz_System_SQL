-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION GetTotalExamMark(@ExamId int) 

RETURNS Float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Total Float;

	-- Add the T-SQL statements to compute the return value here
	SELECT @Total=ISNULL(SUM(Mark),0)
	from Questions
	where ExamId=@ExamId

	-- Return the result of the function
	RETURN ISNULL(@Total,0);

END
GO

