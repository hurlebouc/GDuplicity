//
//  URL.m
//  GDuplicity
//
//  Created by Hubert on 25/08/13.
//  Copyright (c) 2013 Codéin. All rights reserved.
//

#import "URL.h"

@implementation URL

- (NSString*) getCLIURL{
    return _url;
}

- (URL*) initWithString: (NSString*) url {
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

@end
