//
//  AppDelegate.h
//  GDuplicity
//
//  Created by Hubert on 20/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *bouton;
@property (weak) IBOutlet NSTextField *chamsp;
- (IBAction)appuyerBouton:(id)sender;
- (IBAction)lireChamps:(id)sender;

@property (weak) IBOutlet NSButton *caca;
@end
