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

-(id<Option>) getOptions;

@end
