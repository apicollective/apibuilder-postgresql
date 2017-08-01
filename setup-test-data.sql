insert into users
(guid, email, nickname, created_by_guid, updated_by_guid)
values
('00000000-1111-2222-3333-444444444444', 'dev-user@apibuilder.io', 'dev-user', '00000000-1111-2222-3333-444444444444', '00000000-1111-2222-3333-444444444444');

insert into sessions
(id, user_guid, expires_at, created_by_guid, updated_by_guid)
select 'dev', guid, now() + interval '10 years', guid, guid
  from users
 where email='dev-user@apibuilder.io';

