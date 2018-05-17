#import "../Defines.h"
#import "postinst.h"

NSFileManager* fileManager = [NSFileManager defaultManager];

//Returns either iphone, ipad or ipod depending on the device
NSString* deviceModel()
{
  return [[UIDevice.currentDevice.model componentsSeparatedByString:@" "].firstObject lowercaseString];
}

NSDictionary* iPadDefaultModuleOrder()
{
  NSArray* fixed = @[@"com.apple.control-center.ConnectivityModule", @"com.apple.mediaremote.controlcenter.nowplaying",
                     @"com.apple.control-center.DisplayModule", @"com.apple.control-center.AudioModule",
                     @"com.apple.mediaremote.controlcenter.airplaymirroring", @"com.apple.control-center.OrientationLockModule",
                     @"com.apple.control-center.MuteModule", @"com.apple.control-center.DoNotDisturbModule"];

  NSArray* userEnabled = @[@"com.apple.control-center.FlashlightModule", @"com.apple.mobiletimer.controlcenter.timer",
                           @"com.apple.control-center.CalculatorModule", @"com.apple.control-center.CameraModule",
                           @"com.apple.Home.ControlCenter"];

  return @{ @"fixed" : fixed, @"user-enabled" : userEnabled };
}

NSDictionary* iPhoneDefaultModuleOrder()
{
  NSArray* fixed = @[@"com.apple.control-center.ConnectivityModule", @"com.apple.mediaremote.controlcenter.nowplaying",
                     @"com.apple.control-center.OrientationLockModule", @"com.apple.control-center.DoNotDisturbModule",
                     @"com.apple.control-center.DisplayModule", @"com.apple.control-center.AudioModule",
                     @"com.apple.mediaremote.controlcenter.airplaymirroring"];

  NSArray* userEnabled = @[@"com.apple.control-center.FlashlightModule", @"com.apple.mobiletimer.controlcenter.timer",
                           @"com.apple.control-center.CalculatorModule", @"com.apple.control-center.CameraModule",
                           @"com.apple.Home.ControlCenter"];

  return @{ @"fixed" : fixed, @"user-enabled" : userEnabled };
}

NSDictionary* iPodDefaultModuleOrder()
{
  NSArray* fixed = @[@"com.apple.control-center.ConnectivityModule", @"com.apple.mediaremote.controlcenter.nowplaying",
                     @"com.apple.control-center.OrientationLockModule", @"com.apple.control-center.DoNotDisturbModule",
                     @"com.apple.control-center.DisplayModule", @"com.apple.control-center.AudioModule",
                     @"com.apple.mediaremote.controlcenter.airplaymirroring"];

  NSArray* userEnabled = @[@"com.apple.control-center.FlashlightModule", @"com.apple.mobiletimer.controlcenter.timer",
                           @"com.apple.control-center.MuteModule", @"com.apple.control-center.CameraModule",
                           @"com.apple.Home.ControlCenter"];

  return @{ @"fixed" : fixed, @"user-enabled" : userEnabled };
}

//This file appears to use a weird encoding, which is why we need to restore it from the
//binary data, otherwise I cannot seem to generate a 1:1 copy of the stock file
NSData* DefaultModuleSettings()
{
  //Sorry
  char moduleSettingsBinary[] = {0x62, 0x70, 0x6C, 0x69, 0x73, 0x74, 0x30, 0x30, 0xD6, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x0D, 0x10, 0x12, 0x14, 0x16, 0x5F, 0x10, 0x1C, 0x63, 0x6F, 0x6D, 0x2E, 0x61, 0x70, 0x70, 0x6C, 0x65, 0x2E, 0x48, 0x6F, 0x6D, 0x65, 0x2E, 0x43, 0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x43, 0x65, 0x6E, 0x74, 0x65, 0x72, 0x5F, 0x10, 0x24, 0x63, 0x6F, 0x6D, 0x2E, 0x61, 0x70, 0x70, 0x6C, 0x65, 0x2E, 0x63, 0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x2D, 0x63, 0x65, 0x6E, 0x74, 0x65, 0x72, 0x2E, 0x41, 0x75, 0x64, 0x69, 0x6F, 0x4D, 0x6F, 0x64, 0x75, 0x6C, 0x65, 0x5F, 0x10, 0x2B, 0x63, 0x6F, 0x6D, 0x2E, 0x61, 0x70, 0x70, 0x6C, 0x65, 0x2E, 0x63, 0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x2D, 0x63, 0x65, 0x6E, 0x74, 0x65, 0x72, 0x2E, 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x76, 0x69, 0x74, 0x79, 0x4D, 0x6F, 0x64, 0x75, 0x6C, 0x65, 0x5F, 0x10, 0x26, 0x63, 0x6F, 0x6D, 0x2E, 0x61, 0x70, 0x70, 0x6C, 0x65, 0x2E, 0x63, 0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x2D, 0x63, 0x65, 0x6E, 0x74, 0x65, 0x72, 0x2E, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x4D, 0x6F, 0x64, 0x75, 0x6C, 0x65, 0x5F, 0x10, 0x34, 0x63, 0x6F, 0x6D, 0x2E, 0x61, 0x70, 0x70, 0x6C, 0x65, 0x2E, 0x6D, 0x65, 0x64, 0x69, 0x61, 0x72, 0x65, 0x6D, 0x6F, 0x74, 0x65, 0x2E, 0x63, 0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x63, 0x65, 0x6E, 0x74, 0x65, 0x72, 0x2E, 0x61, 0x69, 0x72, 0x70, 0x6C, 0x61, 0x79, 0x6D, 0x69, 0x72, 0x72, 0x6F, 0x72, 0x69, 0x6E, 0x67, 0x5F, 0x10, 0x2E, 0x63, 0x6F, 0x6D, 0x2E, 0x61, 0x70, 0x70, 0x6C, 0x65, 0x2E, 0x6D, 0x65, 0x64, 0x69, 0x61, 0x72, 0x65, 0x6D, 0x6F, 0x74, 0x65, 0x2E, 0x63, 0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x63, 0x65, 0x6E, 0x74, 0x65, 0x72, 0x2E, 0x6E, 0x6F, 0x77, 0x70, 0x6C, 0x61, 0x79, 0x69, 0x6E, 0x67, 0xD1, 0x08, 0x09, 0x54, 0x73, 0x69, 0x7A, 0x65, 0xD2, 0x0A, 0x0B, 0x0C, 0x0C, 0x56, 0x68, 0x65, 0x69, 0x67, 0x68, 0x74, 0x55, 0x77, 0x69, 0x64, 0x74, 0x68, 0x10, 0x01, 0xD1, 0x08, 0x0E, 0xD2, 0x0A, 0x0B, 0x0F, 0x0C, 0x10, 0x02, 0xD1, 0x08, 0x11, 0xD2, 0x0A, 0x0B, 0x0F, 0x0F, 0xD1, 0x08, 0x13, 0xD2, 0x0A, 0x0B, 0x0F, 0x0C, 0xD1, 0x08, 0x15, 0xD1, 0x0B, 0x0F, 0xD1, 0x08, 0x17, 0xD2, 0x0A, 0x0B, 0x0F, 0x0F, 0x00, 0x08, 0x00, 0x15, 0x00, 0x34, 0x00, 0x5B, 0x00, 0x89, 0x00, 0xB2, 0x00, 0xE9, 0x01, 0x1A, 0x01, 0x1D, 0x01, 0x22, 0x01, 0x27, 0x01, 0x2E, 0x01, 0x34, 0x01, 0x36, 0x01, 0x39, 0x01, 0x3E, 0x01, 0x40, 0x01, 0x43, 0x01, 0x48, 0x01, 0x4B, 0x01, 0x50, 0x01, 0x53, 0x01, 0x56, 0x01, 0x59, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x5E};

  return [NSData dataWithBytes:moduleSettingsBinary length:sizeof(moduleSettingsBinary)];
}

NSArray* ModuleWhitelist()
{
  return @[@"com.apple.control-center.ConnectivityModule", @"com.apple.mediaremote.controlcenter.nowplaying",
           @"com.apple.Home.ControlCenter", @"com.apple.control-center.OrientationLockModule",
           @"com.apple.control-center.DoNotDisturbModule", @"com.apple.control-center.DisplayModule",
           @"com.apple.control-center.AudioModule", @"com.apple.control-center.FlashlightModule",
           @"com.apple.mediaremote.controlcenter.airplaymirroring", @"com.apple.mobiletimer.controlcenter.timer",
           @"com.apple.control-center.CalculatorModule", @"com.apple.control-center.CameraModule",
           @"com.apple.control-center.QuickNoteModule", @"com.apple.accessibility.controlcenter.general",
           @"com.apple.accessibility.controlcenter.text.size", @"com.apple.accessibility.controlcenter.guidedaccess",
           @"com.apple.accessibility.controlcenter.hearingdevices", @"com.apple.control-center.AppleTVRemoteModule",
           @"com.apple.control-center.MagnifierModule", @"com.apple.control-center.AlarmModule",
           @"com.apple.control-center.VoiceMemosModule", @"com.apple.control-center.WalletModule",
           @"com.apple.control-center.LowPowerModule", @"com.apple.control-center.stopwatch",
           @"com.apple.replaykit.controlcenter.screencapture", @"com.apple.control-center.TapToRadarModule",
           @"com.apple.control-center.CarryModule", @"com.apple.control-center.CarModeModule",
           @"com.apple.control-center.MuteModule", @"com.apple.control-center.ARTraceModule"];
}

int createBackupDirectory()
{
  BOOL directory;
  if([fileManager fileExistsAtPath:BackupPath isDirectory:&directory] && directory)
  {
    printf("INFO: Backup directory already exists, removing it now.\n");

    NSError* removeError;
    [fileManager removeItemAtPath:BackupPath error:&removeError];

    if(removeError)
    {
      printf("ERROR: Removal of backup directory failed.\nError description:%s.\n", [removeError.localizedDescription UTF8String]);
      return 1;
    }

    printf("SUCCESS: Removed previous backup directory.\n");
  }

  NSError* createError;
  [fileManager createDirectoryAtPath:BackupPath withIntermediateDirectories:NO attributes:nil error:&createError];

  if(createError)
  {
    printf("ERROR: Creation of backup directory failed.\nError description:%s.\n", [createError.localizedDescription UTF8String]);
    return 1;
  }

  printf("SUCCESS: Created backup directory at %s.\n", [BackupPath UTF8String]);

  return 0;
}

int restoreStockFile(NSString* plistPath, id stockPlist)
{
  int success;

  NSData* serializedPropertyList;

  if([stockPlist isKindOfClass:[NSData class]])
  {
    serializedPropertyList = stockPlist;
  }
  else
  {
    success = serializePropertyList(stockPlist, &serializedPropertyList);
    if(success != 0)
    {
      return success;
    }
  }

  success = backupExistingFile(plistPath);
  if(success != 0)
  {
    return success;
  }

  if(![fileManager createFileAtPath:plistPath contents:serializedPropertyList attributes:nil])
  {
    restoreBackupFile(plistPath);

    return 1;
  }

  return 0;
}

int serializePropertyList(NSDictionary* propertyList, NSData** serializedData)
{
  NSError* serializeError;
  *serializedData = [NSPropertyListSerialization dataWithPropertyList:propertyList format:NSPropertyListBinaryFormat_v1_0 options:nil error:&serializeError];

  if(serializeError)
  {
    printf("ERROR: Failed to serialize property list.\nError description:%s.\n", [serializeError.localizedDescription UTF8String]);
    return 1;
  }

  printf("SUCCESS: Dictionary serialized.\n");
  return 0;
}

int backupExistingFile(NSString* plistPath)
{
  NSString* filename = [plistPath lastPathComponent];
  NSString* backupPath = [BackupPath stringByAppendingPathComponent:filename];

  if([fileManager fileExistsAtPath:backupPath])
  {
    printf("INFO: Found previous backup file.\n");
    NSError* removeBackupError;
    [fileManager removeItemAtPath:backupPath error:&removeBackupError];
    if(removeBackupError)
    {
      printf("ERROR: Failed to remove previous backup file.\nError description:%s.\n", [removeBackupError.localizedDescription UTF8String]);
    }

    printf("SUCCESS: Removed previous backup file.\n");
  }

  if([fileManager fileExistsAtPath:plistPath])
  {
    NSError* moveError;
    [fileManager moveItemAtPath:plistPath toPath:backupPath error:&moveError];
    if(moveError)
    {
      printf("ERROR: Unable to move existing file to backup directory.\nError description:%s.\n", [moveError.localizedDescription UTF8String]);
      return 1;
    }
    printf("SUCCESS: Moved existing file to backup directory.\n");
  }

  return 0;
}

int restoreBackupFile(NSString* plistPath)
{
  NSString* filename = [plistPath lastPathComponent];
  NSString* backupPath = [BackupPath stringByAppendingPathComponent:filename];

  printf("ERROR: File write of %s not successful, trying to roll things back.\n", [filename UTF8String]);

  NSError* restoreError;
  [fileManager moveItemAtPath:backupPath toPath:plistPath error:&restoreError];

  if(restoreError)
  {
    //This should theoretically never run ((hopefully))
    printf("FATAL ERROR: Unable to restore backup file. Please ensure the file %s exists before even thinking about rebooting your device.\n", [plistPath UTF8String]);
    return 2;
  }

  printf("SUCCESS: Rolled things back.\n");
  return 1;
}

int main(int argc, const char **argv)
{
  printf("\nINFO: CCCleaner will attempt to restore the stock Control Center system files!\n");
  
  if (geteuid() != 0)
  {
		printf("ERROR: Not run as root.\n");
		return 1;
  }

  if(kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_11_0)
  {
    printf("ERROR: Unsupported iOS version!\n");
    return 1;
  }

  int success;
  NSString* model = deviceModel();
  printf("INFO: Detected device model: %s.\n", [model UTF8String]);

  success = createBackupDirectory();
  if(success != 0)
  {
    return success;
  }

  NSMutableDictionary* plistFiles = [NSMutableDictionary new];

  if([model isEqualToString:@"ipad"])
  {
    [plistFiles setObject:iPadDefaultModuleOrder() forKey:DefaultModuleOrderIPadPath];

    [plistFiles setObject:DefaultModuleSettings() forKey:DefaultModuleSettingsIPadPath];
  }
  else if([model isEqualToString:@"iphone"])
  {
    [plistFiles setObject:iPhoneDefaultModuleOrder() forKey:DefaultModuleOrderIPhonePath];

    [plistFiles setObject:DefaultModuleSettings() forKey:DefaultModuleSettingsIPhonePath];
  }
  else if([model isEqualToString:@"ipod"])
  {
    [plistFiles setObject:iPodDefaultModuleOrder() forKey:DefaultModuleOrderIPodPath];

    //iPod also ships with the iPhone file and while it's probably not being used, it also doesn't hurt to restore it
    [plistFiles setObject:iPhoneDefaultModuleOrder() forKey:DefaultModuleOrderIPhonePath];

    //iPod uses iPhone file path here for some reason
    [plistFiles setObject:DefaultModuleSettings() forKey:DefaultModuleSettingsIPhonePath];
  }
  else
  {
    printf("ERROR: Unsupported device model: %s.\n", [model UTF8String]);
    return 1;
  }

  //ModuleWhitelist is at the same path on all models
  [plistFiles setObject:ModuleWhitelist() forKey:ModuleWhitelistPath];

  printf("\n");

  for(NSString* path in [plistFiles allKeys])
  {
    NSString* filename = [path lastPathComponent];
    printf("INFO: Now restoring file %s.\n", [filename UTF8String]);

    success = restoreStockFile(path, [plistFiles objectForKey:path]);
    if(success != 0)
    {
      printf("ERROR: Unable to restore file %s.\n", [filename UTF8String]);
      return success;
    }

    printf("SUCCESS: Restored file %s.\n\n", [filename UTF8String]);
  }

  printf("SUCCESS: Restored all stock CC system files!\n");

  printf("INFO: Backups files are available at %s.\n", [BackupPath UTF8String]);

  printf("INFO: Backup files will be removed when uninstalling this package.\n\n");

  return 0;
}
