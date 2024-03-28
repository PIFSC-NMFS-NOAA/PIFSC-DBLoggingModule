--------------------------------------------------------
--------------------------------------------------------
--Database Name: Database Log
--Database Description: This module was created to log information in the database for various backend operations.  This is preferable to a file-based log since it can be easily queried, filtered, searched, and used for reporting purposes
--------------------------------------------------------
--------------------------------------------------------


--------------------------------------------------------
--Database Log - version 0.1 rollback:
--------------------------------------------------------

DROP PACKAGE DB_LOG_PKG;

DROP VIEW DB_LOG_ENTRIES_V;


DROP TRIGGER DB_LOG_ENTRIES_AUTO_BRI;

DROP SEQUENCE DB_LOG_ENTRIES_SEQ;


DROP TABLE DB_LOG_ENTRIES;




DROP TRIGGER DB_LOG_ENTRY_TYPES_AUTO_BRI;

DROP TRIGGER DB_LOG_ENTRY_TYPES_AUTO_BRU;

DROP SEQUENCE DB_LOG_ENTRY_TYPES_SEQ;

DROP TABLE DB_LOG_ENTRY_TYPES;




--remove the upgrade version in the database upgrade log table:
DELETE FROM DB_UPGRADE_LOGS WHERE UPGRADE_APP_NAME = 'Database Log' AND UPGRADE_VERSION = '0.1';
COMMIT;