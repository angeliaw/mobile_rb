declare @Activity_id int
declare @CourseStep_id int
declare @CourseLesson_id int
declare @CourseUnit_id int
declare @CourseLevel_id int
declare @CourseActivityContent_id int
declare @ActivityTemplate_id int
 
set @Activity_id = 180213
 
select @CourseLevel_id = l.CourseLevel_id
, @CourseUnit_id = u.CourseUnit_id
, @CourseLesson_id = c.CourseLesson_id
, @CourseStep_id = b.CourseStep_id
, @CourseActivityContent_id = ac.CourseActivityContent_id
, @ActivityTemplate_id = at.ActivityTemplate_id
from SchoolPlatform.dbo.CourseStepActivity a
      inner join SchoolPlatform.dbo.CourseStep(NOLOCK) b on a.CourseStep_id = b.CourseStep_id
      inner join SchoolPlatform.dbo.CourseLesson(NOLOCK) c on b.CourseLesson_id = c.CourseLesson_id
      inner join SchoolPlatform.dbo.CourseUnit(NOLOCK) u on c.CourseUnit_id = u.CourseUnit_id
      inner join SchoolPlatform.dbo.CourseLevel(NOLOCK) l on u.CourseLevel_id = l.CourseLevel_id
      inner join SchoolPlatform.dbo.CourseActivityContent(NOLOCK) ac on ac.CourseActivityContent_id = a.CourseActivityContent_id
      inner join SchoolPlatform.dbo.CourseActivityTemplate(NOLOCK) at on at.ActivityTemplate_id = ac.ActivityTemplate_id
where a.CourseStepActivity_id = @Activity_id
 
select Course_id,LevelNo from SchoolPlatform.dbo.CourseLevel
where CourseLevel_id = @CourseLevel_id
 
select UnitNo from SchoolPlatform.dbo.CourseUnit
where CourseUnit_id = @CourseUnit_id
 
select LessonNo from SchoolPlatform.dbo.CourseLesson
where CourseLesson_id = @CourseLesson_id
 
select StepNo,* from SchoolPlatform.dbo.CourseStep
where CourseStep_id = @CourseStep_id
 
select ActivityNo,* from SchoolPlatform.dbo.CourseStepActivity
where CourseStepActivity_id = @Activity_id
 
select CAST(ActivityContentXml as xml), * FROM SchoolPlatform.dbo.CourseActivityContent
where CourseActivityContent_id = @CourseActivityContent_id
 
select * from SchoolPlatform.dbo.CourseActivityTemplate
where ActivityTemplate_id = @ActivityTemplate_id