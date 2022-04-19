drop table if exists public.generator_invocations;

set search_path to public;

create table generator_invocations (
  id                          text primary key check(util.non_empty_trimmed_string(id)),
  key                         text not null check(util.non_empty_trimmed_string(key)),
  created_at                  timestamptz not null default now(),
  updated_at                  timestamptz not null default now(),
  updated_by_guid             text not null check(util.non_empty_trimmed_string(updated_by_guid)),
  hash_code                   bigint not null
);

select schema_evolution_manager.create_updated_at_trigger('public', 'generator_invocations');