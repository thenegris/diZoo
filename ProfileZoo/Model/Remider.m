//
//  Remider.m
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "Remider.h"

@implementation Remider


-(instancetype) initWithRemainder:(NSString *)type dateTODO:(NSDate *)dateTODO statusTODO:(BOOL)statusTODO
{
    self = [super init];
    
    if (self) {
        _typeRemainder = type;
        _dateTODO = dateTODO;
        _statusTODO = statusTODO;
    }
    
    return self;
}


@end
