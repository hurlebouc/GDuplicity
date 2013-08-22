//
//  Allow_source_mismatch.m
//  GDuplicity
//
//  Created by Hubert on 22/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import "Allow_source_mismatch.h"

@implementation Allow_source_mismatch

-(NSString*)getCLIOption{
    NSString* inter = [other getCLIOption];
    return [inter stringByAppendingString:@" --allow-source-mismatch"];
}

@end
