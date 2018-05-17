#import "../Defines.h"

NSFileManager* fileManager = [NSFileManager defaultManager];

int main(int argc, const char **argv)
{
  printf("\nINFO: About to remove backup files.\n");

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

  BOOL directory;
  if([fileManager fileExistsAtPath:BackupPath isDirectory:&directory] && directory)
  {
    NSError* removeError;
    [fileManager removeItemAtPath:BackupPath error:&removeError];

    if(removeError)
    {
      printf("ERROR: Removal of backup directory failed.\nError description:%s\n", [removeError.localizedDescription UTF8String]);
      return 1;
    }
  }

  printf("SUCCESS: Removed backup files.\n\n");

  return 0;
}
