//
//  Remider.h
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReminderType.h"

@interface Remider : NSObject

@property (nonatomic, copy) ReminderType *remainder;
@property (nonatomic, copy) NSDate *dateToDo;
@property (nonatomic, assign) BOOL status;

@end
