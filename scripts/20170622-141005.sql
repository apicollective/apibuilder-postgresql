create table sessions (
  id                      text primary key,
  user_guid               uuid not null,
  expires_at              timestamptz not null
);

select schema_evolution_manager.create_basic_audit_data('public', 'sessions');

comment on table sessions is '
  Represents a user session (e.g. user logged in to site)
';

create index on sessions(user_guid);
