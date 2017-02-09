update tasks
   set deleted_at = now(),
       deleted_by_guid = 'b0c45ffe-8ab2-4bbd-8742-8d16adbd1dc4'
 where data::text like '%task_data_index_application%'
   and deleted_at is null;

insert into tasks
(guid, data, created_by_guid, updated_by_guid)
select applications.guid,
       ('{"task_data_index_application":{"application_guid":"' || applications.guid::text || '"}}')::json,
       'b0c45ffe-8ab2-4bbd-8742-8d16adbd1dc4', 'b0c45ffe-8ab2-4bbd-8742-8d16adbd1dc4'
  from applications;
