//
//  ActivityLog.m
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "ActivityLog.h"

@implementation ActivityLog


-(instancetype) initWithType:(NSString *)remainder dateDONE:(NSDate *)dateDONE
{
    self = [super init];
    
    if (self) {
        _typeRemainder = remainder;
        _dateDONE = dateDONE;
    }
    
    return self;
}


@end
