update users
   set email = 'admin@apibuilder.io'
 where email = 'admin@apidoc.me'
   and deleted_at is null;
