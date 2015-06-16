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

@property (nonatomic, copy) NSString *typeRemainder;
@property (nonatomic, copy) NSDate *dateTODO;
@property (nonatomic, assign) BOOL statusTODO;
@property (nonatomic, copy) NSString *message;

-(instancetype) initWithRemainder: (NSString *)message type:(NSString *)type dateTODO:(NSDate *) dateTODO statusTODO:(BOOL)statusTODO ;

@end
