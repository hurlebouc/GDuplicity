//
//  IntegerOption.m
//  GDuplicity
//
//  Created by Hubert on 22/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import "StringOption.h"

@implementation StringOption

- (StringOption*) initWithName:(NSString *)name Value:(NSString *)value Option:(id<Option>)opt {
    self = [super init];
    if (self) {
        self->_value = value;
        self->_name = name;
        self->_others = opt;
    }
    return self;
}

- (NSString*) getCLIOption{
    NSString* intermed = [_others getCLIOption];
    NSString* opt = [@" --" stringByAppendingString:_name];
    opt = [opt stringByAppendingFormat:@" %@", _value];
    return [intermed stringByAppendingString:opt];
}

@end
