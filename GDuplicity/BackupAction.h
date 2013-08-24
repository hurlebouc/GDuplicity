//
//  BackupAction.h
//  GDuplicity
//
//  Created by Hubert on 24/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"

@interface BackupAction : NSObject<Action>

@property id<ActionAux> aux;
@property id<Option> opt;
@property id<Path> src;
@property id<Path> tgt;

@end
