drop table if exists public.generator_invocations;

set search_path to public;

create table generator_invocations (
  id                          text primary key,
  key                         text not null,
  created_at                  timestamptz not null default now(),
  updated_at                  timestamptz not null default now(),
  updated_by_user_id          text not null,
  hash_code                   bigint not null
);

select schema_evolution_manager.create_updated_at_trigger('public', 'generator_invocations');
