DECLARE @memberid VARCHAR(100)
DECLARE @StudentCourse_id INT
DECLARE @Courseid INT

SET @memberid = 23804408

SELECT m.memberid, m.Username, m.Password,m.Email,m.PartnerSite,m.Country,m.DataStore,m.CreateDate FROM ET_Main.dbo.Members m (NOLOCK)
WHERE m.memberid = @memberid

SELECT s.MemberId, s.IsActive,s.DateExpires FROM ET_Commerce..Subscriptions AS s WITH (NOLOCK)
WHERE s.MemberId = @memberid