//
//  ReminderType.m
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "ReminderType.h"

@implementation ReminderType



-(instancetype) initWithID:(NSString *)ID Type:(NSString *)type Message:(NSString*)message
{
   
    self = [super init];
    
    if (self) {
        _ID = ID;
        _type = type;
        _message = message;
    }
    
    return self;
}


@end
