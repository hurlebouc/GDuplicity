//
//  AppDelegate.m
//  GDuplicity
//
//  Created by Hubert on 20/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import "AppDelegate.h"
#import "NoOption.h"
#import "BooleanOption.h"
#import "StringOption.h"
#import "IntegerOption.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (id<Option>) getGeneralOptionsFrom: (id<Option>) opt{
    id<Option> res = opt;
    if ([_simuCheck intValue]) {
        res = [[BooleanOption alloc] initWithName:@"dry-run" andOptions:res];
    }
    return res;
}

- (id<Option>) getBackupOptionsFrom: (id<Option>) opt{
    id<Option> res = opt;
    if (![_cryptCheck intValue]) {
        res = [[BooleanOption alloc] initWithName:@"no-encryption" andOptions:res];
    }
    return res;
}

- (id<Option>) getRestoreOptionsFrom: (id<Option>) opt{
    id<Option> res = opt;
    return res;
}

- (IBAction)launchBackup:(id)sender {
    id<Option> opt = [self getGeneralOptionsFrom:[[NoOption alloc] init]];
    opt = [self getBackupOptionsFrom:opt];
    NSString* optCLI = [opt getCLIOption];
    system([optCLI UTF8String]);
}

- (IBAction)selectSource:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];    
    [openDlg setCanChooseFiles:NO];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setAllowsMultipleSelection:NO];
    
    [openDlg runModal];
    
//    if ( [openDlg runModalForDirectory:nil file:nil] == NSOKButton )
//    {
//        // Get an array containing the full filenames of all
//        // files and directories selected.
//        NSArray* files = [openDlg filenames];
//        
//        // Loop through all the files and process them.
//        for( i = 0; i < [files count]; i++ )
//        {
//            NSString* fileName = [files objectAtIndex:i];
//        }
//    }
}
- (IBAction)launchRestore:(id)sender {
}
@end
