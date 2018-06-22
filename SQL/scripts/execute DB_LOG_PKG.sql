--in order to execute the DB_LOG_PKG to add a message to the DB_LOG_ENTRIES table execute the following code:
--:entry_type_code corresponds to a DB_LOG_ENTRY_TYPES record's ENTRY_TYPE_CODE value for the type of log entry you want to create (e.g. DEBUG)
--:log_source is the given application/script/module that was being executed when the log entry was inserted (e.g. convert_download_package_to_bagit.php, DVM, etc.)
--:log_entry_content is the actual log message content that will be inserted into the database (e.g. The data validation module was successfully executed on the DS_BAGIT_PKG_LOGS record (PKG_LOG_ID: 92))
--:RETURN_ID is an output variable that will return the procedure return code (1 for success and 0 for failure)

BEGIN
	DB_LOG_PKG.ADD_LOG_ENTRY(:entry_type_code, :log_source, :log_entry_content, :RETURN_ID);
END;

