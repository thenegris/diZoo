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

@property (nonatomic, copy) NSString *typeRemainder;
@property (nonatomic, copy) NSDate *dateDONE;


-(instancetype) initWithType:(NSString *)remainder dateDONE:(NSDate *)dateDONE;

@end
