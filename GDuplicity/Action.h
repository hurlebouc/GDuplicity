//
//  Action.h
//  GDuplicity
//
//  Created by Hubert on 23/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Option.h"
#import "ActionAux.h"
#import "Path.h"
#import "URL.h"

@protocol Action <NSObject>

- (NSString*) getCLIAction;

@end
