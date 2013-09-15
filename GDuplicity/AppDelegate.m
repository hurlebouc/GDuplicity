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
    NSBundle* mainBundle;
    mainBundle = [NSBundle mainBundle];
//    NSLog(@"%@", [mainBundle builtInPlugInsPath]);
//    NSArray* bndltab = [NSBundle allFrameworks];
//    NSLog(@"%ld", (unsigned long)[bndltab count]);
//    for (int i=0; i<[bndltab count]; i++) {
//        NSLog(@"%@", [[bndltab objectAtIndex:i] bundlePath]);
//    }
    NSString* plugpath = [[mainBundle builtInPlugInsPath] stringByAppendingString:@"/duplicity.bundle"];
    NSBundle* plugins = [NSBundle bundleWithPath:plugpath];
    if (plugins == nil) {
        NSLog(@"ERREUR : le chargement de duplicity a échoué");
    } else {
        _duplicityPath = [plugins executablePath];
        NSLog(@"%@", _duplicityPath);
    }
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

// Backup

- (IBAction)launchBackup:(id)sender {
    id<Option> opt = [self getGeneralOptionsFrom:[[NoOption alloc] init]];
    opt = [self getBackupOptionsFrom:opt];
    id<ActionAux> aux;
    if ([_forceFullCheck intValue]) {
        aux = [[FullAux alloc] init];
    } else {
        aux = [[NoAux alloc] init];
    }
    NSString* src = [@" " stringByAppendingString:[_backupSourceField stringValue]];
    NSString* tgt = [@" " stringByAppendingString:[_backupTargetField stringValue]];
    Path* path = [[Path alloc] initWithString:src];
    URL* url = [[URL alloc] initWithString:tgt];
    id<Action> act = [[BackupAction alloc]
                      initWithAux:aux
                      Option: opt
                      Path: path
                      URL: url];
    NSString* actCLI = [_duplicityPath stringByAppendingString:[act getCLIAction]];
    actCLI = [@"ulimit -n 1024;" stringByAppendingString:actCLI];
    actCLI = [actCLI stringByAppendingString:@" 2> ~/Desktop/error.txt"];
    if ([_cryptCheck intValue]) {
        NSString* pwd = [_pwdField stringValue];
        NSString* export = [NSString stringWithFormat:@"export PASSPHRASE=%@;", pwd];
        actCLI = [export stringByAppendingString:actCLI];
    }
    system("echo $PATH > ~/Desktop/path.txt");
    int n = system([actCLI UTF8String]);
    NSLog(@"%@\ncaca : %d", actCLI, n);
    NSString* message = [@"retour : " stringByAppendingString:[NSString stringWithFormat:@"%d", n]];
    NSRunAlertPanel(@"Fin", message, @"bachi", @"", @"");
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
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:NO];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setAllowsMultipleSelection:NO];
    
    if ( [openDlg runModal] == NSOKButton ) {
        NSArray* files = [openDlg URLs];
        NSURL* fileName = [files objectAtIndex:0];
        NSString* tgt = [fileName absoluteString];
        tgt = [tgt stringByReplacingOccurrencesOfString:@"file://localhost" withString:@"file://"];
        [_backupTargetField setStringValue:tgt];
    }
}

// Restore

- (IBAction)launchRestore:(id)sender {
    id<Option> opt = [self getGeneralOptionsFrom:[[NoOption alloc] init]];
    opt = [self getRestoreOptionsFrom:opt];
    NSString* src = [@" " stringByAppendingString:[_restoreSourceField stringValue]];
    NSString* tgt = [@" " stringByAppendingString:[_restoreTargetField stringValue]];
    URL* url = [[URL alloc] initWithString:src];
    Path* path = [[Path alloc] initWithString:tgt];
    id<Action> act = [[RestoreAction alloc]
                      initWithOpt:opt
                      URL:url
                      Path:path];
    NSString* actCLI = [_duplicityPath stringByAppendingString:[act getCLIAction]];
    actCLI = [@"ulimit -n 1024;" stringByAppendingString:actCLI];
    system([actCLI UTF8String]);
    NSRunAlertPanel(@"Fin", @"Normalement y a pas eu de merde.", @"OK", @"", @"");
}

- (IBAction)restoreSelectSource:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:NO];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setAllowsMultipleSelection:NO];
    
    if ( [openDlg runModal] == NSOKButton ) {
        NSArray* files = [openDlg URLs];
        NSURL* fileName = [files objectAtIndex:0];
        NSString* tgt = [fileName absoluteString];
        tgt = [tgt stringByReplacingOccurrencesOfString:@"file://localhost" withString:@"file://"];
        [_restoreSourceField setStringValue:tgt];
    }
}

- (IBAction)restoreSelectTarget:(id)sender {
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:YES];
    [openDlg setCanChooseDirectories:YES];
    [openDlg setAllowsMultipleSelection:NO];
    
    if ( [openDlg runModal] == NSOKButton ) {
        NSArray* files = [openDlg URLs];
        NSURL* fileName = [files objectAtIndex:0];
        [_backupTargetField setStringValue:[fileName relativePath]];
    }
}

// Enablings

- (IBAction)restoreEnableLocal:(id)sender {
    if ([_restoreLocalCheck intValue]) {
        [_restoreSourceButton setEnabled:YES];
    } else {
        [_restoreSourceButton setEnabled:NO];
    }
}


- (IBAction)backupEnablePwd:(id)sender {
    if ([_cryptCheck intValue]) {
        [_pwdField setEnabled:YES];
    } else {
        [_pwdField setEnabled:NO];
    }
}

- (IBAction)backupEnableLocal:(id)sender {
    if ([_backupLocalCheck intValue]) {
        [_backupTargetButton setEnabled:YES];
    } else {
        [_backupTargetButton setEnabled:NO];
    }
}

@end
