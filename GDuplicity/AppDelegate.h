//
//  AppDelegate.h
//  GDuplicity
//
//  Created by Hubert on 20/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Option.h"
#import "Action.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

// Backup
// -- Options
@property (weak) IBOutlet NSButtonCell *cryptCheck;
// -- Parameters
@property (weak) IBOutlet NSTextFieldCell *backupSourceField;
@property (weak) IBOutlet NSTextFieldCell *backupTargetField;
@property (weak) IBOutlet NSButtonCell *forceFullCheck;
@property (weak) IBOutlet NSSecureTextFieldCell *pwdField;
@property (weak) IBOutlet NSCollectionView *excludeCollection;
@property (weak) IBOutlet NSButtonCell *localCheck;
@property (weak) IBOutlet NSButtonCell *backupTargetButton;
- (IBAction)launchBackup:(id)sender;
- (IBAction)selectSource:(id)sender;
- (IBAction)enablePwd:(id)sender;
- (IBAction)enableLocal:(id)sender;

// Restore

@property (weak) IBOutlet NSTextFieldCell *restoreSourceField;
@property (weak) IBOutlet NSTextFieldCell *restoreTargetField;
@property (weak) IBOutlet NSButtonCell *launchRestore;
- (IBAction)launchRestore:(id)sender;

// Output
@property (weak) IBOutlet NSButtonCell *simuCheck;
@property (weak) IBOutlet NSProgressIndicator *progressBar;

@end
