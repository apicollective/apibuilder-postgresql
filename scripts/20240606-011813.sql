drop table if exists public.tasks;

set search_path to public;

create table tasks (
  id                          text primary key check(util.non_empty_trimmed_string(id)),
  type                        text not null check(util.non_empty_trimmed_string(type)),
  type_id                     text not null check(util.non_empty_trimmed_string(type_id)),
  organization_guid           uuid,
  num_attempts                bigint not null check(num_attempts >= 0),
  next_attempt_at             timestamptz not null,
  errors                      json,
  stacktrace                  text check(util.null_or_non_empty_trimmed_string(stacktrace)),
  data                        json not null,
  created_at                  timestamptz not null default timezone('utc'::text, now())::timestamptz,
  updated_at                  timestamptz not null default timezone('utc'::text, now())::timestamptz,
  updated_by_guid             text not null check(util.non_empty_trimmed_string(updated_by_guid)),
  hash_code                   bigint not null,
  unique(type_id, type)
);

create index tasks_num_attempts_next_attempt_at_idx on tasks(num_attempts, next_attempt_at);

select schema_evolution_manager.create_updated_at_trigger('public', 'tasks');