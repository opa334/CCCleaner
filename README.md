# CCCleaner
CCCleaner aims to restore the stock Control Center files of iOS 11 and 12.
This is useful if you have messed with these files before and experience issues related to that.

Upon installation, CCCleaner will attempt to restore stock versions of the following files:

/System/Library/PrivateFrameworks/ControlCenterServices.framework/DefaultModuleOrder~(iphone/ipad/ipod).plist (on iOS 11, file no longer exists in iOS 12)
/System/Library/PrivateFrameworks/ControlCenterServices.framework/ModuleWhitelist.plist
/System/Library/PrivateFrameworks/ControlCenterUI.framework/DefaultModuleSettings~(iphone/ipad).plist

Backups of the original files are kept inside /var/CCCleaner_Backups, but only until you remove this package.
Additionally, if any restore operation fails, CCCleaner will attempt automatically restore the backup file before aborting the process.
If this tool still happens to break something, you can also manually move the backup files to their former locations.
