//
//  URL.h
//  GDuplicity
//
//  Created by Hubert on 25/08/13.
//  Copyright (c) 2013 Codéin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URL : NSObject

@property NSString* url;

- (NSString*) getCLIURL;
- (URL*) initWithString: (NSString*) url;

@end
