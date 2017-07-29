alter table generators.generators alter column attributes set data type json using attributes::json;
update generators.generators set attributes ='[]'::json where attributes is null;
alter table generators.generators alter column attributes set not null;
