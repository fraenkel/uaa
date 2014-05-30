-- column that holds the origin of the user, something like 'uaa' or 'ldap' or 'keystone'
ALTER TABLE users ADD COLUMN origin varchar(36) default 'unknown' NOT NULL;
-- track a users external user ID. For LDAP it is the DN or UID
ALTER TABLE users ADD COLUMN external_id varchar(255) default NULL;

-- redo the unique key
DROP INDEX unique_uk_1 ON users;
-- add a user_id column to
CREATE UNIQUE INDEX users_unique_key ON users (username, origin);

