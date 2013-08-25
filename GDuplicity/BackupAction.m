//
//  BackupAction.m
//  GDuplicity
//
//  Created by Hubert on 24/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#import "BackupAction.h"

@implementation BackupAction

- (NSString*) getCLIAction{
    NSString* res = @" ";
    res = [res stringByAppendingString:[_aux getCLIAux]];
    res = [res stringByAppendingString:[_opt getCLIOption]];
    res = [res stringByAppendingString:[_src getCLIPath]];
    res = [res stringByAppendingString:[_tgt getCLIURL]];
    return res;
}

- (BackupAction*) initWithAux: (id<ActionAux>) aux
                       Option: (id<Option>) opt
                         Path: (Path*) src
                          URL: (URL*) tgt {
    self = [super init];
    if (self) {
        _aux = aux;
        _opt = opt;
        _src = src;
        _tgt = tgt;
    }
    return self;
}
@end
