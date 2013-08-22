//
//  BooleanOption.m
//  GDuplicity
//
//  Created by Hubert on 22/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import "BooleanOption.h"

@implementation BooleanOption

- (BooleanOption*) initWithName:(NSString *)name andOptions:(id<Option>)opt{
    self = [super init];
    if (self) {
        self->_name = name;
        self->_others = opt;
    }
    return self;
}

- (NSString*) getCLIOption{
    NSString* intermed = [_others getCLIOption];
    NSString* opt = [@"--" stringByAppendingString:_name];
    return [intermed stringByAppendingString:opt];
}

@end
