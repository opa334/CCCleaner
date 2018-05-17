NSString* deviceModel();
NSDictionary* iPadDefaultModuleOrder();
NSDictionary* iPhoneDefaultModuleOrder();
NSDictionary* iPodDefaultModuleOrder();
NSArray* moduleWhitelist();

int createBackupDirectory();
int restoreStockFile(NSString* plistPath, NSDictionary* stockPlist);
int backupExistingFile(NSString* plistPath);
int serializePropertyList(NSDictionary* propertyList, NSData** serializedData);
int restoreBackupFile(NSString* plistPath);
