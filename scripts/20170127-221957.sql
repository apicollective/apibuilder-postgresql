alter table cache.services disable trigger user;
delete from cache.services where version != '0.11.26';
alter table cache.services enable trigger user;

