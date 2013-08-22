//
//  Archive_dir.m
//  GDuplicity
//
//  Created by Hubert on 22/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import "Archive_dir.h"

@implementation Archive_dir

-(NSString*)getCLIOption{
    NSString* inter = [other getCLIOption];
    NSString* opt = [@" --archive-dir " stringByAppendingString:value];
    return [inter stringByAppendingString:opt];
}

@end
