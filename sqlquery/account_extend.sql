 declare  @Member_id INT
 set @Member_id = 23828415

 /*Update Subscriptions*/
 select top 10 * from ET_Commerce.dbo.Subscriptions
 update ET_Commerce.dbo.Subscriptions   set isactive = 1, datedeactivated = null, DateExpires = '2016-10-30 04:09:00'
 where memberid = @Member_id

 /*Update FeatureAccessGrants*/
 update ET_Commerce.dbo.FeatureAccessGrants
 set ActiveTo = '2016-5-17 14:16:04.040'
 where memberid = @Member_id