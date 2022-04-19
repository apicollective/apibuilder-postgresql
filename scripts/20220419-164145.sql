create schema util;
set search_path to util;

create or replace function non_empty_trimmed_string(p_value text) returns boolean immutable cost 1 language plpgsql as $$
  begin
    if p_value is null or trim(p_value) = '' or trim(p_value) != p_value then
      return false;
    else
      return true;
    end if;
  end
$$;
