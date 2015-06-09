//
//  Pet.m
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "Pet.h"

@implementation Pet

- (instancetype)initWithUID:(NSString *)uid
{
    self = [super init];
    
    if (self) {
        
        _uid = uid;
        _name = @"";
        _breed = @"";
        _dateBirth = nil;
        _uidPerson = @"";
        
    }
    
    return self;
}

- (instancetype)initWithUID:(NSString *) uid name:(NSString *)name breed:(NSString *)breed dateBirth:(NSDate  *)dateBirth personUID:(NSString *)personUID
{
    self = [self initWithUID:uid];
    
    if (self) {
        
        _name = name;
        _breed = breed;
        _dateBirth = dateBirth;
        _uidPerson = personUID;
    }
    
    return self;
}

- (instancetype)initWithUID:(NSString *) uid name:(NSString *)name breed:(NSString *)breed dateBirth:(NSDate  *)dateBirth personUID:(NSString *)personUID remainders:(NSDictionary *)remainders activitylog:(NSDictionary*)activitylog
{

    self = [self initWithUID:uid name:name breed:breed dateBirth:dateBirth personUID:personUID];
    
    
    if(self){
        
        _remainders = remainders;
        _activitylog = activitylog;
    }
    
    return self;
}

@end
