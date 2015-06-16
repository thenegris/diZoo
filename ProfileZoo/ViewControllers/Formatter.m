//
//  DateFomartter.m
//  ProfileZoo
//
//  Created by Diana Granados on 14/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "Formatter.h"

@implementation Formatter



+ (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSString *format = kDateFormat;
    [dateFormatter setDateFormat:format];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}
@end
