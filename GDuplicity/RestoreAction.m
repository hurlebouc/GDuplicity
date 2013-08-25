//
//  RestoreAction.m
//  GDuplicity
//
//  Created by Guy Godfroy on 25/08/13.
//  Copyright (c) 2013 Codéin. All rights reserved.
//

#import "RestoreAction.h"

@implementation RestoreAction

- (NSString*) getCLIAction{
    NSString* res = @"duplicity";
    res = [res stringByAppendingString:[_opt getCLIOption]];
    res = [res stringByAppendingString:[_src getCLIURL]];
    res = [res stringByAppendingString:[_tgt getCLIPath]];
    return res;
}

- (RestoreAction*) initWithOpt:(id<Option>)opt URL:(URL *)src Path:(Path *)tgt{
    self = [super init];
    if (self) {
        _opt = opt;
        _src = src;
        _tgt = tgt;
    }
    return self;
}

@end
