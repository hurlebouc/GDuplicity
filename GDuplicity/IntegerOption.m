//
//  StringOption.m
//  GDuplicity
//
//  Created by Hubert on 22/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import "IntegerOption.h"

@implementation IntegerOption

-(IntegerOption*) initWithName:(NSString*)name Value:(NSInteger)value Option:(id<Option>)opt {
    self = [super init];
    if (self) {
        self->_name = name;
        self->_value = value;
        self->_others = opt;
    }
    return self;
}

- (NSString*) getCLIOption{
    NSString* intermed = [_others getCLIOption];
    NSString* opt = [@" --" stringByAppendingString:_name];
    opt = [opt stringByAppendingFormat:@" %ld", _value];
    return [intermed stringByAppendingString:opt];
}

@end
