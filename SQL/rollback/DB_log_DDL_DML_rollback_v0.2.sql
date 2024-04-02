--------------------------------------------------------
--------------------------------------------------------
--Database Name: Database Log
--Database Description: This module was created to log information in the database for various backend operations.  This is preferable to a file-based log since it can be easily queried, filtered, searched, and used for reporting purposes
--------------------------------------------------------
--------------------------------------------------------


--------------------------------------------------------
--Database Log - version 0.2 rollback:
--------------------------------------------------------

--decrease the size of the DB_LOG_ENTRIES.LOG_SOURCE table field to accommodate additional use cases


UPDATE DB_LOG_ENTRIES SET LOG_SOURCE = SUBSTR(LOG_SOURCE, 1, 200);

ALTER TABLE DB_LOG_ENTRIES
MODIFY (LOG_SOURCE VARCHAR2(200 BYTE) );

--recompile the dependent view since the view source table definition has changed
ALTER VIEW DB_LOG_ENTRIES_V COMPILE;

--recompile the package since the source table definition has changed
ALTER PACKAGE DB_LOG_PKG COMPILE;

--remove the upgrade version in the database upgrade log table:
DELETE FROM DB_UPGRADE_LOGS WHERE UPGRADE_APP_NAME = 'Database Log' AND UPGRADE_VERSION = '0.2';
COMMIT;
