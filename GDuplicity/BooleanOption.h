//
//  BooleanOption.h
//  GDuplicity
//
//  Created by Hubert on 22/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Option.h"

@interface BooleanOption : NSObject <Option>

@property id<Option> others;
@property NSString* name;

- (BooleanOption*)initWithName:(NSString*) name andOptions: (id<Option>) opt;

@end
