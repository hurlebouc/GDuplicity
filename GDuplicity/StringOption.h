//
//  IntegerOption.h
//  GDuplicity
//
//  Created by Hubert on 22/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Option.h"

@interface StringOption : NSObject<Option>

@property id<Option> others;
@property NSString* value;
@property NSString* name;

-(StringOption*) initWithName:(NSString*) name Value:(NSString*) value Option:(id<Option>) opt;

@end
