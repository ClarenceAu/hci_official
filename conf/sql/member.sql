/* member.free */
select * from member as m where m.id not in (select pm.member_id from project_member as pm ,project as p where p.id= pm.project_id and p.state =1) and m.state=1 and m.type=3

/* member.free.count */
select count(m.id) from member as m where m.id not in (select pm.member_id from project_member as pm ,project as p where p.id= pm.project_id and p.state =1) and m.state=1 and m.type=3


/* member.department.state */
select * from member where id not in(select member_id from department_member where departemt_id = @departmemtId ) and state = @state

/* member.department.state.count */
select count(id) from member where id not in(select member_id from department_member where departemt_id = @departmemtId ) and state = @state


