use prajakta;

############################################
/*inner join */
############################################
select s.name,s.course from students s 
join course c on s.course=c.course;

############################################
/*left join/ left outer join */
############################################
select c.course_id, s.name from students s 
left join course c on c.course=s.course;
select c.course_id, s.name from course c
left join students s  on c.course=s.course;

############################################
/*right join/ right outer join */
############################################
select c.course_id,s.name from students s 
right join course c on c.course=s.course;
select c.course_id,s.name from course c 
right join  students s on c.course=s.course;

############################################
/*full join/ full outer join */
############################################
select c.course_id,s.name from students s
full join course c s.name, c.course_id;

############################################
/*cross join */
############################################
select c.course_id,s.name from students s
cross join course c ;
select c.course_id,s.name from course c 
cross join students s;

select s.name, c.course_id from students s
cross join course c ;
select s.name, c.course_id from course c 
cross join students s order by c.course_id desc;













