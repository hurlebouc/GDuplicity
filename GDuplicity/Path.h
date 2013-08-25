//
//  Path.h
//  GDuplicity
//
//  Created by Hubert on 25/08/13.
//  Copyright (c) 2013 Codéin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Path : NSObject

@property NSString* path;

- (NSString*) getCLIPath;
- (Path*) initWithPath: (NSString*) path;

@end
