//
//  AppDelegate.m
//  GDuplicity
//
//  Created by Hubert on 20/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)appuyerBouton:(id)sender {
    system("say caca");
    [self->_chamsp setStringValue:@"caca"];
}

- (IBAction)lireChamps:(id)sender {
    NSString* val = [self->_chamsp stringValue];
    system([@" " UTF8String]);
}
@end
