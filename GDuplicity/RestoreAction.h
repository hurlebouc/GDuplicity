//
//  RestoreAction.h
//  GDuplicity
//
//  Created by Guy Godfroy on 25/08/13.
//  Copyright (c) 2013 Codéin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"

@interface RestoreAction : NSObject<Action>

@property id<Option> opt;
@property URL* src;
@property Path* tgt;

- (RestoreAction*) initWithOpt: (id<Option>) opt
                           URL: (URL*) src
                          Path: (Path*) tgt;

@end
