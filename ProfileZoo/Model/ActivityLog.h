//
//  ActivityLog.h
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReminderType.h"

@interface ActivityLog : NSObject

@property (nonatomic, copy) ReminderType *remainder;
@property (nonatomic, copy) NSDate *dateDone;

@end
