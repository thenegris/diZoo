//
//  ReminderType.h
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReminderType : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *message;


-(instancetype) initWithID:(NSString *)ID Type:(NSString *)type Message:(NSString*)message;

@end
