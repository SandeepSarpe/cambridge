DO $$     
begin
	create table if not exists etl.employee(emp_id serial,emp_name varchar(100),salary numeric(10,4),dept_id int references etl.department(dept_id),primary key(emp_id) );
	if not exists(select true from information_schema.columns where table_name='employee' and table_schema='etl' and column_name='score') then
	       alter table etl.employee add column score numeric(10,4);
	end if; 
end	
$$;

