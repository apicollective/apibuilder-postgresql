set search_path to public;

alter table generator_invocations add organization_key text check(util.null_or_non_empty_trimmed_string(organization_key));
alter table generator_invocations add application_key  text check(util.null_or_non_empty_trimmed_string(application_key));
