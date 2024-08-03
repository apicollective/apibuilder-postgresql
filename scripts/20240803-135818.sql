alter table changes add constraint changes_changed_by_guid_fk foreign key (changed_by_guid) references users;
