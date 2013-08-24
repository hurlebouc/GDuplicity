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

- (id<Option>) getGeneralOptions{
    id<Option> res = [[NoOption alloc] init];
    if ([_simuCheck intValue]) {
        res = [[BooleanOption alloc] initWithName:@"dry-run" andOptions:res];
    }
    return res;
}

-(id<Option>) getBackupOptions{
    id<Option> res = [[NoOption alloc] init];
    if (![_cryptCheck intValue]) {
        res = [[BooleanOption alloc] initWithName:@"no-encryption" andOptions:res];
    }
    return res;
}

-(id<Option>) getRestoreOptions{
    id<Option> res = [[NoOption alloc] init];
    if (![_cryptCheck intValue]) {
        res = [[BooleanOption alloc] initWithName:@"no-encryption" andOptions:res];
    }
    return res;
}

- (IBAction)launchBackup:(id)sender {
    [self getGeneralOptions];
}
- (IBAction)launchRestore:(id)sender {
}
@end
