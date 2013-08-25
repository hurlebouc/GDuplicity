//
//  Path.m
//  GDuplicity
//
//  Created by Hubert on 25/08/13.
//  Copyright (c) 2013 Codéin. All rights reserved.
//

#import "Path.h"

@implementation Path

- (NSString*) getCLIPath {
    return _path;
}

- (Path*) initWithPath: (NSString*) path {
    self = [super init];
    if (self) {
        _path = path;
    }
    return self;
}

@end
