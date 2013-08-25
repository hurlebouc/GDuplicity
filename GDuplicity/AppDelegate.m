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
#import "FullAux.h"
#import "IncrAux.h"
#import "NoAux.h"
#import "BackupAction.h"
#import "RestoreAction.h"

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
    id<ActionAux> aux;
    if ([_forceFullCheck intValue]) {
        aux = [[FullAux alloc] init];
    } else {
        aux = [[NoAux alloc] init];
    }
    Path* path = [[Path alloc] initWithString:[_backupSourceField stringValue]];
    URL* url = [[URL alloc] initWithString:[_backupTargetField stringValue]];
    id<Action> act = [[BackupAction alloc]
                      initWithAux:aux
                      Option: opt
                      Path: path
                      URL: url];
    NSString* actCLI = [act getCLIAction];
    system([actCLI UTF8String]);
}

- (IBAction)backupSelectSource:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];    
    [openDlg setCanChooseFiles:YES];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setAllowsMultipleSelection:NO];
        
    if ( [openDlg runModal] == NSOKButton ) {
        NSArray* files = [openDlg URLs];
        NSURL* fileName = [files objectAtIndex:0];
        [_backupSourceField setStringValue:[fileName relativePath]];
    }
}

- (IBAction)backupSelectTarget:(id)sender {
    
}

// Enablings

- (IBAction)enablePwd:(id)sender {
    if ([_cryptCheck intValue]) {
        [_pwdField setEnabled:YES];
    } else {
        [_pwdField setEnabled:NO];
    }
}

- (IBAction)enableLocal:(id)sender {
    if ([_localCheck intValue]) {
        [_backupTargetButton setEnabled:YES];
    } else {
        [_backupTargetButton setEnabled:NO];
    }
}
- (IBAction)launchRestore:(id)sender {
}
@end
