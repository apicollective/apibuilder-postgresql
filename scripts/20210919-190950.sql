alter table changes add is_material boolean default true not null;
alter table changes alter column is_material drop default;
update changes set is_material = false where lower(description) like '%version%';
