create index versions_application_guid_not_deleted_idx on versions(application_guid) where deleted_at is null;
create unique index organizations_guid_not_deleted_idx on organizations(guid) where deleted_at is null;
