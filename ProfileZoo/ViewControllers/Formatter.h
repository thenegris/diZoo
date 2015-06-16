//
//  DateFomartter.h
//  ProfileZoo
//
//  Created by Diana Granados on 14/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* kDateFormat = @"dd-MM-yyyy";

@interface Formatter : NSObject

+ (NSString *)formatDate:(NSDate *)date;
@end
