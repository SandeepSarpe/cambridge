DO $$
BEGIN         
	create table if not exists etl.department(dept_id serial,dept_name varchar(100),primary key(dept_id));
	if not exists(select true from information_schema.columns where table_name='department' and table_schema='etl' and column_name='company_name') then
	       alter table etl.department add column company_name varchar(100);
	end if;   

	if not exists(select true from information_schema.columns where table_name='department' and table_schema='etl' and column_name='company_address') then
	       alter table etl.department add column company_address varchar(100);
	end if; 

	if not exists(select true from information_schema.columns where table_name='department' and table_schema='etl' and column_name='company_type') then
	       alter table etl.department add column company_type varchar(100);
	end if; 

	if  exists(select true from information_schema.columns where table_name='department' and table_schema='etl' and column_name='company_type') then
	       alter table etl.department drop column company_type;
	end if; 

END 
$$;
