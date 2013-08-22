//
//  Allow_source_mismatch.h
//  GDuplicity
//
//  Created by Hubert on 22/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Option.h"

@interface Allow_source_mismatch : NSObject <Option>{
    id<Option> other;
}

@end
