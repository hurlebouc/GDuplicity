//
//  Archive_dir.h
//  GDuplicity
//
//  Created by Hubert on 22/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Option.h"

@interface Archive_dir : NSObject <Option>{
    id<Option> other;
    NSString* value;
}

@end
