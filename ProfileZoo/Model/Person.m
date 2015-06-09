//
//  Person.m
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithUID:(NSString *)uid
{

    self = [super init];
    
    if(self)
    {
        _uid =uid;
        _agreementChecked = NO;
        _pets =  [NSArray array];
    }
    
    return self;
}

- (instancetype)initWithUID:(NSString *) uid agreementChecked:(BOOL) agreementChecked pets:(NSArray *)pets
{
    
    self = [self initWithUID:uid];
    if (self) {
        _agreementChecked = agreementChecked;
        _pets = pets;
    }
    return self;
}

@end
